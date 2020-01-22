`timescale 1ns / 1ps

module concurrentQ1( //concurrent truth table implemtation - reduces to ~A~B + AB~C where inputs = ABC
    input[2:0] inputs,
    output result
    );
    
    assign result = (!inputs[2] && !inputs[1]) | (inputs[2] && inputs[1] && !inputs[0]);   
endmodule


module caseBehavioralQ1( //case implementation of truth table
    input[2:0] inputs,
    output reg result
    );
    
    always@(inputs)
    begin
        case(inputs)
            3'b000: result <= 1;
            3'b001: result <= 1;
            3'b110: result <= 1;
            default: result <= 0;
        endcase
    end
    
endmodule
    
module ifBehavioralQ1( //if implementation of truth table leveraging Verilog's reg/wire decoding to decimal
    input[2:0] inputs,
    output reg result
    );
    
    always@(inputs)
    begin
        if(inputs == 0)
            result = 1;
        else if (inputs == 1)
            result = 1;
        else if (inputs == 3'b110)
            result = 1;
        else
            result = 0;
    end
endmodule

module structuralQ1( //structural implementation of truth table
    input[2:0] inputs,
    output result
    );
    wire not0, not1, not2, result0, result1, result2;
    not n1(not2, inputs[2]);
    not n2(not1, inputs[1]);
    not n3(not0, inputs[0]);  
    
    and a1(result0, not2, not1, not0);
    and a2(result1, not2, not1, inputs[0]);
    and a3(result2, inputs[2], inputs[1], not0);
    
    or o1(result, result0, result1, result2);
    
endmodule

module reducedQ1( //reduction operators 
    input[2:0] inputs,
    output result
    );
    
   assign result = ~|(inputs[2:1]) | (inputs[1]&!inputs[0]);
      
endmodule