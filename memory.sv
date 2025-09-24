`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 09:04:05 PM
// Design Name: 
// Module Name: memory
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


module memory (
               input logic read, write, clk,
               input logic [4:0] addr,
               input logic [7:0] data_in,
               output logic [7:0] data_out);

 logic [7:0] memory [0:31]; 
  
  always @(posedge clk)
    if (write && !read)
      #1 memory[addr] <= data_in;
    
  always_ff @(posedge clk iff ((read == '1) && (write == '0)))
      data_out <= memory[addr];
       
endmodule
