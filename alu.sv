`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 08:52:30 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


import opcodes::*;
module alu (input logic clk,
            input logic [7:0] accum, 
            input logic [7:0] data,     
            input opcode_t opcode,
            output logic [7:0] out,
            output logic zero
            );
 
  always_comb
  zero = (accum == 0) ? 1 : 0;

  always @(negedge clk)
    unique case (opcode)
      HLT: out <= accum;
      SKZ: out <= accum;
      ADD: out <= accum + data;   
      AND: out <= accum & data;
      XOR: out <= accum ^ data;
      LDA: out <= data;
      STO: out <= accum;
      JMP: out <= accum;
      default: out <= accum;
  endcase  
  
endmodule



