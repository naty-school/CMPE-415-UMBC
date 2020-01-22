`timescale 1ns / 1ps
module ssdControl(
    input clk, BTNC, BTNL, BTNR, BTNU, BTND,
    input[3:0] pol1, pol2, thief1, thief2,
    output reg [6:0] ssd,
    output reg [7:0] AN,
    output reg [15:0] LED
    );
    
    reg [2:0] select;
    wire outClk, outClkSlow, outReset, outU, outR, outL, outD, sigD, sigU, sigL, sigR, sigReset;
    reg [3:0]  digit, t1, t2, p1, p2;
    reg [7:0] moveCount, minMoves;
    wire[7:0] decimalCount;
    reg wonGame = 0, lostGame = 0;
    
    //Task to get the minimum number of moves between the Police and Thief locations
    task getDistance;
        input [3:0] p1, p2, t1, t2;
        output reg [7:0] distance;

        reg [3:0] xDiff, yDiff;
        begin
            xDiff  = t1 - p1;
            if(xDiff[3] == 1)
                xDiff = ~xDiff+1; //2s complement inversion
                
            yDiff  = t2 - p2;
            if(yDiff[3] == 1)
                yDiff = ~yDiff+1; //2s complement inversion
                               
            distance = xDiff + yDiff;
        end
    endtask
    
    //Instanite 1kHz clock to switch between SSDs and 1 Hz clock to blink lights.
    clkDivider ssdClk(.clk(clk), .out_1kHz(outClk));
    clkDivider2 ledClk(.clk(clk), .outSig(outClkSlow));
    
    //BCD decoder for number of moves
    bcd bcdDecoder(.number(moveCount), .tens(decimalCount[7:4]), .ones(decimalCount[3:0]));
    
    //Debouncing logic for clear and 4 direction buttons
    Filter #(.wd(16),.n(65535),.bound(64000)) resetButton(.clk(clk),.data_in(BTNC), .data_out(outReset));
    Debouncer centerD(.clk(clk),.sigIn(outReset),.sigOut(sigReset));
 
    Filter #(.wd(16),.n(65535),.bound(64000)) left(.clk(clk),.data_in(BTNL), .data_out(outL));
    Debouncer leftD(.clk(clk),.sigIn(outL),.sigOut(sigL));
    
    Filter #(.wd(16),.n(65535),.bound(64000)) right(.clk(clk),.data_in(BTNR), .data_out(outR));
    Debouncer rightD(.clk(clk),.sigIn(outR), .sigOut(sigR));
    
    Filter #(.wd(16),.n(65535),.bound(64000)) up(.clk(clk),.data_in(BTNU), .data_out(outU));
    Debouncer upD(.clk(clk),.sigIn(outU), .sigOut(sigU));
    
    Filter #(.wd(16),.n(65535),.bound(64000)) down(.clk(clk),.data_in(BTND), .data_out(outD));
    Debouncer downD(.clk(clk),.sigIn(outD), .sigOut(sigD));
    
    //Blink LEDs if Game is Won @ 1 Hz rate. Otherwise set LEDs off
    always@(posedge outClkSlow)
    begin
        if(wonGame == 1)
            LED[15:0] <= ~LED[15:0];
        else
            LED[15:0] <= {15{1'b0}};
    end

    //Find if game is over. If moveCount is over the limit or position of thief = position of police, set GameWon/Lost flags 
//    always@(posedge clk)
 //   begin


   // end
    
        
    always@(posedge clk)
    begin
        //If positions are equal and moves is lower, you win
        if((p1 == t1) && (p2 == t2) && moveCount < (minMoves+6))
        begin
            wonGame <= 1;
        end
        //If too many moves, you lost
        else if(moveCount >= (minMoves+5))
            lostGame <= 1;
            
        else
        //Otherwise you neither won or lost
        begin
            wonGame <= 0;
            lostGame <= 0;
        end
        
        //Change police position based on buttons. button hierarchy established 
        //(reset->L->R->U->D priority if multiple pushed)
        if(sigReset)    //ButtonC pushed, set police position to switches
        begin
            p1 <= pol1;
            p2 <= pol2;
            t1 <= thief1;
            t2 <= thief2;
            moveCount <= 0;
            getDistance(pol1, pol2, thief1, thief2, minMoves); //Use switch positions 
        end
        
        //Lock buttons on win/loss
        else if(wonGame || lostGame)
        begin
            p1 <= p1;
            p2 <= p2;
            moveCount <= moveCount;
        end
        
        //Directional movement logic blocks
        else if(sigL)    //ButtonL pushed, set police X position 1 lower
        begin
            moveCount = moveCount + 1;
            if(p1 != 4'b0000)
                p1 <= p1 - 1;
        end
        
        else if(sigR)    //ButtonR pushed, set police X position 1 lower
        begin
            moveCount = moveCount + 1;
            if(p1 != 4'b1111)
                p1 <= p1 + 1;
        end
        
        else if(sigU)    //ButtonU pushed, set police Y position 1 higher
        begin
            moveCount = moveCount + 1;
            if(p2 != 4'b1111)
                p2 <= p2 + 1;
        end
        
        else if(sigD)    //ButtonD pushed, set police Y position 1 lower
        begin
            moveCount = moveCount + 1;
            if(p2 != 4'b0000)
                p2 <= p2 - 1;
        end
    end
    
    //1 kHz SSD Toggle
    always@(posedge outClk)
    begin
        if (outReset)
            select <= 0;
        else
            select <= select + 1;
    end
    
    //SSD Multiplexing. Switch between SSDSs and digit values @ 1kHz clock toggle in select
    always@(*)
    case(select)
    3'b000:
        begin
        digit <= p2;
        AN <= 8'b11101111;
    end
    
    3'b001:
    begin
        digit <= p1;
        AN <= 8'b11011111;
    end
    
    3'b010:
    begin
        digit <= t2;
        AN <= 8'b10111111;
    end
    
    3'b011:
    begin
        digit <= t1;
        AN <= 8'b01111111;
    end
    
    3'b100:
    begin
        digit <= decimalCount[7:4];
        AN <= 8'b11111101;
    end
    
    3'b101:
    begin
        digit <= decimalCount[3:0];
        AN <= 8'b11111110;
    end
    
    default:
    begin
        digit <= decimalCount[3:0];
        AN <= 8'b11111111;
    end
    endcase
    
    //Segment Decoding
    always @(posedge clk)
    case (digit)
      4'b0000: ssd <= 7'b0000001;
      4'b0001: ssd <= 7'b1001111;
      4'b0010: ssd <= 7'b0010010;
      4'b0011: ssd <= 7'b0000110;
      4'b0100: ssd <= 7'b1001100;
      4'b0101: ssd <= 7'b0100100;
      4'b0110: ssd <= 7'b0100000;
      4'b0111: ssd <= 7'b0001111;
      4'b1000: ssd <= 7'b0000000;
      4'b1001: ssd <= 7'b0000100;
      4'b1010: ssd <= 7'b0001000;
      4'b1011: ssd <= 7'b1100000;
      4'b1100: ssd <= 7'b0110001;
      4'b1101: ssd <= 7'b1000010;
      4'b1110: ssd <= 7'b0110000;
      4'b1111: ssd <= 7'b0111000;
endcase   

endmodule

//1kHz clkDivider
module clkDivider(
    input clk,
    output reg out_1kHz
    );
        //1 khz clock divider 
    reg [16:0] count_reg = 0;
    always @(posedge clk) begin
     begin
        if (count_reg < 100000) 
        begin
            count_reg <= count_reg + 1;
        end 
        else begin
            count_reg <= 0;
            out_1kHz <= ~out_1kHz;
            end	
        end
    end
endmodule

//1 Hz clk Divider
module clkDivider2(
    input clk,
    output reg outSig
    );
        //1 khz clock divider 
    reg [27:0] count_reg = 0;
    always @(posedge clk) begin
     begin
        if (count_reg < 50000000) 
        begin
            count_reg <= count_reg + 1;
        end 
        else begin
            count_reg <= 0;
            outSig <= ~outSig;
            end	
        end
    end
endmodule

module Debouncer(
    input clk, sigIn, q,
    output sigOut
);
    dff_resetless r1(.clk(clk), .data(sigIn), .q(q));
    assign sigOut = sigIn & !q;
endmodule

module dff_resetless(
    input clk,
    input data, 
    output reg q
);
    always@(posedge clk)
    begin
        q <= data;
    end
endmodule

//hex to bcd decoder
module bcd(number, tens, ones);
   // I/O Signal Definitions
   input  [7:0] number;
   output reg [3:0] tens;
   output reg [3:0] ones;
   
   // Internal variable for storing bits
   reg [19:0] shift;
   integer i;
   
   always @(number)
   begin
      // Clear previous number and store new number in shift register
      shift[15:8] = 0;
      shift[7:0] = number;
      
      // Loop eight times
      for (i=0; i<8; i=i+1) begin
         if (shift[11:8] >= 5)
            shift[11:8] = shift[11:8] + 3;
            
         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      tens     = shift[15:12];
      ones     = shift[11:8];
   end
 
endmodule