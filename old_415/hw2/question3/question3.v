`timescale 1ns / 1ps


module regALUCase( //Case implementation clocked w/ synchronous reset
    input [7:0] num1,
    input [7:0] num2,
    input [3:0] select,
    input clk,
    input reset,
    output reg [7:0] result
    );
    
    always@(posedge clk)
    begin
    if(reset)
        begin
            result <= 0;
        end
    else
        case(select)
            0:      result = num1 + num2;
            1:      result = num1 - num2;
            2:      result = num1 * num2;
            3:      result = num1 << num2;
            4:      result = num1 >>> num2;
            5:      result = num1 & num2;
            6:      result = num1 | num2;
            7:      result = num1 ^ num2;
            8:      result = !(num1 & num2);
            default:    result = -num1;
        endcase
    end
    
endmodule

module regALUIf(
    input [7:0] num1,
    input [7:0] num2,
    input [3:0] select,
    input clk,
    input reset,
    output reg [7:0] result
    );
    
    always@(posedge clk)
    begin
    if(reset)
        result <= 0;
    else
        if(select == 0)
            result = num1 + num2;
        else if(select == 1)
            result = num1 - num2;  
        else if(select == 2)
            result = num1 * num2;    
        else if(select == 3)
            result = num1 << num2;    
        else if(select == 4)
            result = num1 >>> num2;    
        else if(select == 5)
            result = num1 & num2;    
        else if(select == 6)
            result = num1 | num2;
        else if(select == 7)
            result = num1 ^ num2;    
        else if(select == 8)
            result = !(num1 & num2);    
        else
            result = -num1;               
    end
    
endmodule
