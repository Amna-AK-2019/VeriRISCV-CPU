`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 09:17:57 PM
// Design Name: 
// Module Name: register
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


module register (input logic [7:0] data_in,    
                 input logic rst, clk, enable,
                 output logic [7:0] out);
  
  always_ff @(posedge clk or negedge rst)
    if (!rst)
      out <= 0;
    else if (enable)   
      out <= data_in;  
  
endmodule