`timescale 1ns / 1ps

module Q3_tb();
reg[7:0] num1, num2;
reg[3:0] select;
wire[7:0] case_result, if_result;
reg reset, clk;

regALUCase alu2(num1, num2, select, clk, reset, case_result);
regALUIf alu3(num1, num2, select, clk, reset, if_result);

initial
 begin
    clk = 0;
    reset = 0;
    select <= 0;
    num1 = 8;
    num2 = 4;
    #20 num1 <= 9;
    num2 = 7;
    #20 num1 = 8'hF;
    num2 = 8'hA;
    #20 $finish;
 end
 
 always
 begin
    #3 clk <= ~clk;
    #1 select <= select + 1;
    if(select == 11)
        reset <= 1;
 end   
 
endmodule

