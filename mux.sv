`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 08:35:27 PM
// Design Name: 
// Module Name: mux
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


module mux(
input logic [4:0] in_a, in_b,
input logic fetch,
output logic [4:0] out
);
  always_comb
    unique case (fetch)
      1'b1: out = in_a;
      1'b0: out = in_b;
      default: out = 'x;
    endcase 
  
endmodule
