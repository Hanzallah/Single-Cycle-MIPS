`timescale 1ns / 1ps

module controller(input  logic[5:0] op, funct,
                  input  logic     zero, bge, // change
                  output logic     memtoreg, memwrite,
                  output logic     pcsrc, alusrc,
                  output logic     regdst, regwrite,
                  output logic     jump,
                  output logic[2:0] alucontrol);

   logic [1:0] aluop;
   logic       branch, branch_greater_equal; // change

   maindec md (op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, 
		 jump, aluop, branch_greater_equal); // change

   aludec  ad (funct, aluop, alucontrol);

   assign pcsrc = (branch & zero) | (bge & branch_greater_equal); // change

endmodule