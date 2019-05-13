`timescale 1ns / 1ps
module maindec (input logic[5:0] op, 
	              output logic memtoreg, memwrite, branch,
	              output logic alusrc, regdst, regwrite, jump,
	              output logic[1:0] aluop, output logic branch_greater_equal ); // change
   logic [9:0] controls; // change

   assign {regwrite, regdst, alusrc, branch, memwrite,
                memtoreg,  aluop, jump, branch_greater_equal} = controls; // change

  always_comb
    case(op)
      6'b000000: controls <= 10'b1100001000; // R-type
      6'b100011: controls <= 10'b1010010000; // LW
      6'b101011: controls <= 10'b0010100000; // SW
      6'b000100: controls <= 10'b0001000100; // BEQ
      6'b001000: controls <= 10'b1010000000; // ADDI
      6'b000010: controls <= 10'b0000000010; // J
      6'b010010: controls <= 10'b0001000101; // bge new addition // change
      6'b010011: controls <= 10'b1010110000; // SwapRM new addition // change
      default:   controls <= 10'bxxxxxxxxxx; // illegal op
    endcase
endmodule
