`timescale 1ns / 1ps



module aluAssign( //concurrent assignment of ALU from Q2
    input [7:0] num1,
    input [7:0] num2, //input 2 numbers
    input [3:0] select, //4 bit select register - 
    output [7:0] result //8 bit result
    );
    assign result = (select==0)?    num1 + num2:
                    (select==1)?    num1 - num2:
                    (select==2)?    num1 * num2:
                    (select==3)?    num1 << num2:
                    (select==4)?    num1 >>> num2:
                    (select==5)?    num1 & num2:
                    (select==6)?    num1 | num2:
                    (select==7)?    num1 ^ num2:
                    (select==8)?    !(num1 && num2): //Else   
                                    -num1; //#s above 9 are Don't Cares which evaluate to NOT
    
endmodule

module aluCase( //Case implementation
    input [7:0] num1,
    input [7:0] num2,
    input [3:0] select,
    output reg [7:0] result
    );
    
    always@(select)
    begin
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

module aluIf( //if implementation
    input [7:0] num1,
    input [7:0] num2,
    input [3:0] select,
    output reg [7:0] result
    );
    
    always@(select)
    begin
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