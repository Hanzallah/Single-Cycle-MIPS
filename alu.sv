`timescale 1ns / 1ps
module alu(input  logic [31:0] a, b, 
           input  logic [2:0]  alucont, 
           output logic [31:0] result,
           output logic zero, bge);

    always_comb
  begin
      case(alucont)
          3'b000: result = a & b;
          3'b001: result = a | b;
          3'b010: result = a + b;
          3'b110: result = a - b;
          3'b111: result = a < b;
          default: result = 0;
      endcase
  end
    assign zero = (result == 32'b0);
    assign bge = ~result[31];
endmodule