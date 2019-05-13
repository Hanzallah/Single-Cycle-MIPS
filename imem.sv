`timescale 1ns / 1ps
module imem ( input logic [5:0] addr, output logic [31:0] instr);

// imem is modeled as a lookup table, a stored-program byte-addressable ROM
	always_comb
	   case ({addr,2'b00})		   	// word-aligned fetch
//		address		instruction
//		-------		-----------
        // Test New Instructions
        8'h00: instr = 32'h23bdfffc; // addi $sp, $sp, -4 
        8'h04: instr = 32'h20080005; // addi $t0, $zero, 5 
        8'h08: instr = 32'h20090006; // addi $t1, $zero, 6
        8'h0c: instr = 32'hafa80000; // sw $t0, ($sp) 
        
        8'h10: instr = 32'h67a90000; // swapRM $t1, ($sp)
        8'h14: instr = 32'h8fa80000; // lw $t0, ($sp)
        
        8'h18: instr = 32'h61090001; // bge $t0, $t1, go
        8'h1c: instr = 32'h08100008; // j continue
        8'h20: instr = 32'hafa90000; // go: sw $t1, ($sp)
        8'h24: instr = 32'h23bd0004; // continue: addi $sp, $sp, 4
	     default:  instr = {32{1'bx}};	// unknown address
	   endcase
endmodule