`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 08:53:22 PM
// Design Name: 
// Module Name: opcodes
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


package opcodes; 

  typedef enum logic [2:0] {HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} opcode_t;

endpackage:opcodes