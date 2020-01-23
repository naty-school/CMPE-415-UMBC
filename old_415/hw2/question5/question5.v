`timescale 1ns / 1ps

module counter4(
    input load,
    input enable,
    input [3:0] v,
    input up,
    input clear,
    input clk,
    output rc0,
    output reg [3:0] q
    );
    
    reg[2:0] le; //Concatenates Enable, Load and Clear for easy Case statement
    assign rc0 = (q == 15 && up == 1) | (q == 0 && up == 0 && clear == 0);
    
    always@(posedge clk or posedge clear)
    begin
        le = {enable, load, up}; //Concatenates them for Case below
        if(clear)
        begin
            q <= 0; //when RESET set Q to 0 and effectively RC0 as well
        end
        else
        begin
            case(le) //LE = [ENABLE LOAD UP]. If LE < 4, Enable is OFF - See default Case
                4:  begin            //ENABLE High, LOAD low, UP low (so counts down)
                    q <= q - 1;
                    end
                5:  begin           //ENABLE High, LOAD low, UP High (so counts up)
                    q <= q + 1;
                    end
                    
                6:  begin           //ENABLE High, LOAD High, UP low or High (so loads value)
                    q <= v;
                    end
                7:  begin           //Same as 6, but Verilog Cases don't allow DC Bits as far as I know
                    q <= v;
                    end
                    
                default:    begin   //Enable off, hold value
                    q<= q;
                            end 
            endcase
        end
    end
    
endmodule

module counter8(
    input load,
    input enable,
    input [7:0] v,
    input up,
    input clear,
    input clk,
    output rc0,
    output [7:0] q
    );
    
    reg enable2 = 0; 
    wire rc01 = 0, rc02 = 0;  
    assign rc0 = (rc01 && rc02); //Assign RC2 to either 11111111 or 00000000
    
    counter4 c1(load, enable, v[3:0], up, clear, clk, rc01, q[3:0]);
    counter4 c2(load, enable2, v[7:4], up, clear, clk, rc02, q[7:4]);

    always@(posedge clk or posedge clear or negedge load) 
    //Need to check on load - otherwise ENABLE2 sometimes stays on after Load is off
    begin
        if((q[3:0] == 15 && up == 1)||(q[3:0] == 1 && up == 0))
        begin
            enable2 <= 1; //Only use 2nd counter when 1st ocunter reaches 0
        end
        else if(enable == 1 && load == 1)
            enable2 <= 1; //or if loading in an 8-bit value
        else
            enable2 <= 0;
    end
endmodule 