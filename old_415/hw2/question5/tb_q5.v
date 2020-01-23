`timescale 1ns / 1ps


module tb_q5(
    );
    reg[3:0] loadVal;
    reg load, enable, clear,up, clk;
    wire[3:0] resultVal;
    wire rc0;
    
    counter4 counterA(load, enable, loadVal, up, clear, clk, rc0, resultVal);
    
    initial
    begin
        $display("At time ", $time, " << Starting the Simulation >>"); 
        //This block initializes the outputs and clock to 0 to avoid unknown values
        //and inputs to appropriate values
        clear = 1;
        clk = 0;
        loadVal = 10;
        enable = 1;
        load = 1;
        up = 0;
        
        #1 clear = 0; //begin counting down for 6 clock cycles = 12/2
        #2 load = 0;
        
        #12 up = 1;  //count up for 20 clock cycles
        
        #40 $finish;
    end
    
    always
    begin
        #1 clk <= ~clk;
    end
    
endmodule
