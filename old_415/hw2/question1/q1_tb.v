`timescale 1ns / 1ps

module ptA_tb();
reg[2:0] bits;
wire outA, outB, outC, outD, outE;

concurrentQ1 testA(bits, outA);
caseBehavioralQ1 testB(bits, outB);
ifBehavioralQ1 testC(bits, outC);
structuralQ1 testD(bits, outD);
reducedQ1 testE(bits, outE);

always
    #1 bits = bits + 1;

initial
 begin
    $display("At time ", $time, " << Starting the Simulation >>");
    bits = 0;
    #35 $finish;
 end
 
endmodule

