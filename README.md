# CMPE-415-UMBC
### old 415
Beginner FPGA class projects. Documentation is sketchy or nonexistent. 
Mainly here for personal storage, but if you want to look at them go ahead.
Note that they aren't particularly good though.

### Links

https://eclipse.umbc.edu/robucci/cmpe415/ - old 415 site, useful for reference.

https://www.xilinx.com/support/university/vivado/vivado-teaching-material/hdl-design.html - Xilinx tutorial. These are **very** good

https://github.com/Digilent?utf8=%E2%9C%93&q=Nexys&type=&language= - Digilent Nexys Demos. If you like this stuff and find it fun, spend some time on these. They're out-of-box fully functional and will teach you stuff. FYI the Nexys A7 and DDR4 are effectively the same board

TRUST ME THIS IS IMPORTANT. I know these can be annoying, but until you've experienced race condition hell you don't understand www.sunburst-design.com/papers/CummingsSNUG2000SJ_NBA.pdf

https://insights.sigasi.com/opinion/jan/verilogs-major-flaw/ - explanation of deltas and how nonblocking works

https://www.eetimes.com/understanding-clock-domain-crossing-issues/# - Clock Domain Crossing for beginners

https://www.nandland.com/articles/block-ram-in-fpga.html - What is a BRAM?

http://vhdlguru.blogspot.com/2011/01/block-and-distributed-rams-on-xilinx.html - Block Ram vs. Distributed RAM

https://www.reddit.com/r/FPGA/comments/eri97t/beginner_explanation_of_fpga_memory_uses/ - My Reddit post on this topic. I asked the question and got some really good answers. (go ahead, all my post history on this account is FPGA or CMPE college stuff)

https://zipcpu.com/dsp/2017/10/27/lfsr.html - LFSR Theory and Galois Fields for beginners (useful for understanding boolean logic)

http://www.asic-world.com/examples/verilog/d_ff.html - Verilog DFF, no Set (aka hold or enable), synchronous or async

https://inst.eecs.berkeley.edu/~cs150/sp12/resources/FSM.pdf- FSMs in Verilog

https://courses.cs.washington.edu/courses/cse370/09wi/ - I really like this course, but you can't access some stuff you need to do the tutorials as presented and need to adjust them

https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html - 7-Segment Display tutorial. Works as is, but you need to change the XDC for the Nexys instead of Basys

### Beginner FPGAs
There's a 33% discount for students/teachers on most FPGAs, so if these are your thing this is the time. All prices below include the discount.
#### Xilinx - get free vivado at https://www.xilinx.com/products/design-tools/vivado/vivado-webpack.html

https://store.digilentinc.com/nexys-a7-fpga-trainer-board-recommended-for-ece-curriculum/ - **200$** - The board you use for class. It's a nice board, and has far and away the best IO options like displays, buttons and switches. Gread PMOD setup, ADC, good media connectors (VGA, audio codec, ethernet setup). Probably costs more than you should spend on a non-SoC FPGA

https://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/?gclid=EAIaIQobChMI4LzeqI6a5wIVEJSzCh1x5QdFEAAYASAAEgIvEvD_BwE - **112$** - Same concept as Nexys, just smaller, fewer displays, switches, etc. but a very similar board. The perk of the Nexys/Basys is the plethora of tutorials (see the digilent github above). Nexys will be useful for much bigger projects dues to far more extensive IO and much bigger memory.

http://www.tul.com.tw/ProductsPYNQ-Z2.html - **110$** - I own this board. It's one of the cheapest SoCs out there, but is a **really** excellent board. Some of the best value for your money as you get into SoC stuff. The downside is it's a little harder for beginners to use, and may require a PMOD set for stuff like SSDs. It also allows you to program FPGAs in Python if you put the time in to learn how to do it.

https://www.96boards.org/product/ultra96/ - **250$** - there's a strong case this is the best board for the value in the sub $1k range. The only competitor board is more expensive, which is the ....

https://store.digilentinc.com/zedboard-zynq-7000-arm-fpga-soc-development-board/ - **360** - Zedboard - A really incredible SoC board, but a lot more expensive than others on this list.

#### Altera - Get free Quartus https://fpgasoftware.intel.com/?edition=lite

https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=234&No=1021 - **$55** - DE10Lite
https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=165&No=593&PartNo=2 - **$61** - DE0Nano-Non-Soc 
Very similar to the DE10 Lite, but has a ton of IO headers in exchange for no 7-segments and stuff like that. DE0nano vs. DE10lite is basically the same conversation as Pynq Z2 vs. Basys above. For a cheap beginner FPGA, probably the DE10 makes more sense. You're not doing too much with either of these

My Pick for low budget:
https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=165&No=1046 - **$110** - DE10-nano
https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=165&No=941 - **$90** - DE0 SoC version - Neither have great IO stuff like SSDs, so I'd go the cheaper DE0. These are solid FPGAs in general. DE10 has a much bigger FPGA, so it'll likely work for bigger projects. DE10 also has HDMI, which is very good to have.

The One I'm TAing 415 to buy:
https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=165&No=1081 - **$260** - DE10-Standard
This is the Altera equivalent of the Zedboard and Nexys combined pretty much. Wait its got a high-speed SoC? HSMC too(ask me what that means)? And 6 7-Segments? and lots of switches/buttons? And I can get crazy amounts of memory off an SD card controller? And a 24-bit codec? I'm in. This is the board to buy if you want an affordable board with a ton of versatility. (Basically the Zedboard 100$ cheaper)


### Free Student Software I want to try personally

https://www.sigasi.com/try-form-edu/ - Sigasi IDE. VHDL only. I've heard great things and have been doing VHDL mostly lately. May be in your best interest to practice VHDL since every DoD company around MD uses it

https://www.mentor.com/company/higher_ed/modelsim-student-edition - Modelsim is an awesome simulator, but it only works on 32-bits and is a bit jumpy on Linux. It's great on Windows though. It's best used if you know how to run .do scripts

https://www.aldec.com/en/products/fpga_simulation/active_hdl_student - I actually have this one and haven't used it much. It's a little more involved than Modelsim, but the GUI is way better.

MATLAB Student Edition - It's free at UMBC. Those of you who don't understand what this has to do with FPGAs have much to learn.
