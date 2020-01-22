`timescale 1ns / 1ps

module bitChanger(
		 input [63:0] x,
		 input clk,
		 output reg [63:0] u
    );
	 
	always @(posedge clk) begin: PLACEHOLDER_NAME //Named Block to instantiate I to allow Blocking
	   integer i;  
	   for(i = 1; i < 8; i = i + 2)          
	   begin
	   //An Explanation:
	   //LHS: Multiplies index by 8 (since it's evaluating 1 at a time)
	   //Since the LHS is a 2 Byte block, it begins above the higher block 8(I+1)
	   //And extends to the lower block 8(I). The -1 is for offset reasons.
			u[(8*(i+1)-1) -: 16] <= {x[8*i-1 -: 8], x[8*(i+1)-1 -: 8]};
	   end
	
	end


endmodule
