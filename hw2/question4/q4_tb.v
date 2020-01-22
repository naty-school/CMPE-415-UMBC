`timescale 1ns / 1ps

module Q4_tb();

reg[63:0] X;
wire[63:0] U;
reg clk;

bitChanger checkBits(X, clk, U);

initial
 begin
    clk = 1;
    X = 0;
    #50 $finish;
 end
 
 always
 begin
    #1 X = X + 64'hffffff;
    clk = ~clk;
 end
 
endmodule

