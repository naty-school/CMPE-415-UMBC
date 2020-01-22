`timescale 1ns / 1ps

module Q2_tb();
reg[7:0] num1, num2;
reg[3:0] select;
wire[7:0] assign_result, case_result, if_result;

aluAssign alu1(num1, num2, select, assign_result);
aluCase alu2(num1, num2, select, case_result);
aluIf alu3(num1, num2, select, if_result);

initial
 begin
    select = 0;
    num1 = 8;
    num2 = 4;
    $display("At time ", $time, " << Starting the ALU Simulation >>");
    #20 num1 = 9;
    num2 = 7;
    #20 num1 = 8'hF;
    num2 = 8'hA;
    #20 $finish;
 end
 
 always
    #1 select = select + 1;
 
endmodule

