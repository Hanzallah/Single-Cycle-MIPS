`timescale 1ns / 1ps
module MIPS_Test();
    logic clk, reset;
    logic memwrite;
    logic[31:0] writedata, dataadr, pc, instr;
    
    top dut(clk, reset, writedata, dataadr, pc, instr, memwrite);
    
    initial begin
            // Initialize Inputs
            clk = 0; reset = 1; #25;
            reset = 0;  #25;
        end
        
      always
        begin
            clk = !clk; #25;
        end  
endmodule