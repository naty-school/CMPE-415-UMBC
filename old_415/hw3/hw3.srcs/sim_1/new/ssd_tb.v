`timescale 1ns / 1ps

module ssd_tb(
    );
    reg btnc=0, btnu=0, btnd=0, btnr=0, btnl=0, clk = 0;
    wire[6:0] ssd, test;
    wire[7:0] AN;
    reg[3:0] police1;
    reg[3:0] police2, thief1, thief2;
    
    ssdControl ssd1(clk, btnc, btnl, btnr, btnu, btnd, police1, police2, thief1, thief2, ssd, AN, test);
    
    initial
    begin
        police1 = 12;
        police2 = 3;
        thief1 = 10;
        thief2 = 15;
        btnc = 1;
        #10 btnc = 0;
        #15 $finish;
    end
    
    always
    begin
        #1 clk <= ~clk;
    end
    
endmodule
