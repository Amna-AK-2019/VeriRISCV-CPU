`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 09:22:38 PM
// Design Name: 
// Module Name: counter
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

module counter (input logic [4:0] data,
                input logic rst, load_pc, enable, clk,
                output logic [4:0] count);

  
  always@(posedge clk or negedge rst) 
    if (!rst)
      count <= 0;  
    else if (load_pc)
    count <= data; 
    else if (enable)
    count <= count + 1;

endmodule
