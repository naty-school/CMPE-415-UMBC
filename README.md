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
There's a 33% discount for students/teachers on most FPGAs, so if these are your thing this is the time
#### Xilinx

https://store.digilentinc.com/nexys-a7-fpga-trainer-board-recommended-for-ece-curriculum/ - **200$** - The board you use for class. It's a nice board, and has far and away the best IO options like displays, buttons and switches. Gread PMOD setup, ADC, good media connectors (VGA, audio codec, ethernet setup). Probably costs more than you should spend on a non-SoC FPGA



### Free Student Software I want to try personally

https://www.sigasi.com/try-form-edu/ - Sigasi IDE. VHDL only. I've heard great things and have been doing VHDL mostly lately. May be in your best interest to practice VHDL since every DoD company around MD uses it

https://www.mentor.com/company/higher_ed/modelsim-student-edition - Modelsim is an awesome simulator, but it only works on 32-bits and is a bit jumpy on Linux. It's great on Windows though. It's best used if you know how to run .do scripts

https://www.aldec.com/en/products/fpga_simulation/active_hdl_student - I actually have this one and haven't used it much. It's a little more involved than Modelsim, but the GUI is way better.

MATLAB Student Edition - It's free at UMBC. Those of you who don't understand what this has to do with FPGAs have much to learn.
