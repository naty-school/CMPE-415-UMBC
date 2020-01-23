`timescale 1ns / 1ps


module counter8_q5(
    );
    reg[7:0] loadVal;
    reg load, enable, clear,up, clk;
    wire[7:0] resultVal;
    wire rc0, test;
    
    counter8 counterA(load, enable, loadVal, up, clear, clk, rc0, resultVal, test);
    
    initial
    begin
        $display("At time ", $time, " << Starting the Simulation >>"); 
        //This block initializes the outputs and clock to 0 to avoid unknown values
        //and inputs to appropriate values
        clear = 1;
        clk = 1;
        loadVal = 122;
        enable = 1;
        load = 1;
        up = 0;
        
        #1 clear = 0; 
        #2 load = 0;
        

        #248 $finish;
    end
    
    always
    begin
        #1 clk <= ~clk;
    end
    
endmodule
