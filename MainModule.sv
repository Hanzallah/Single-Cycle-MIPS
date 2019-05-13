`timescale 1ns / 1ps
module MainModule(input  clk,clear, execute_button, reset_button,     
                     output memwrite, output DP, output [3:0] AN, output [6:0] C);
    logic clk_pulse, reset;
    logic [3:0] enables = 4'b1111;
    logic[31:0] writedata, dataadr, pc, instr;
    
    top  process(clk_pulse, reset, writedata, dataadr, pc, instr, memwrite); 
    
    display_controller disp(clk, reset,enables, writedata[7:4], writedata[3:0], dataadr[7:4], dataadr[3:0], AN, C, DP);  
    pulse_controller pulse1(clk, execute_button, clear,clk_pulse);
    pulse_controller pulse2(clk, reset_button, clear,reset);
endmodule
