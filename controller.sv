`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2025 09:33:09 PM
// Design Name: 
// Module Name: controller
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
module controller (input logic rst, clk, zero,
                   input opcode_t opcode,
                   output logic halt, load_ac, mem_rd, mem_wr, inc_pc, load_pc, load_ir);
  
  typedef enum logic [2:0] {INST_ADDR_SETUP, INST_FETCH, INST_LOAD, IDLE_DECODE, OP_ADDR_SETUP, OP_FETCH, ALU_OP, STORE} state_t;
  
  state_t state;
  logic aluopcode;

  assign aluopcode = (opcode == ADD || opcode == AND || opcode == XOR ||opcode == LDA) ? 1 : 0;
  
  always_ff @(posedge clk or negedge rst)
    if (!rst)
      state <= INST_ADDR_SETUP;
    else 
      state <= state.next();
  
  always_comb begin
    unique case (state)
    INST_ADDR_SETUP: begin
                     mem_rd = 0;
                     load_ir = 0;
                     halt = 0;
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 0;        
                     mem_wr = 0;
                     end
    INST_FETCH:      begin 
                     mem_rd = 1;
                     load_ir = 0;
                     halt = 0;
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 0;        
                     mem_wr = 0;
                     end
    INST_LOAD :      begin         
                     mem_rd = 1;   
                     load_ir = 1;  
                     halt = 0;
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 0;        
                     mem_wr = 0;
                     end
    IDLE_DECODE:     begin         
                     mem_rd = 1;   
                     load_ir = 1;  
                     halt = 0;
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 0;        
                     mem_wr = 0;
                     end
    OP_ADDR_SETUP:   begin
                     mem_rd = 0;   
                     load_ir = 0;  
                     halt = (opcode == HLT);
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 1;        
                     mem_wr = 0;
                     end
    OP_FETCH  :      begin
                     mem_rd = aluopcode;   
                     load_ir = 0;  
                     halt = 0;
                     load_ac = 0;
                     load_pc = 0; 
                     inc_pc = 0;        
                     mem_wr = 0;
                     end
    ALU_OP    :      begin
                     mem_rd = aluopcode;   
                     load_ir = 0;  
                     halt = 0;
                     load_ac = aluopcode;
                     load_pc = (opcode == JMP); 
                     inc_pc = (zero && (opcode == SKZ));       
                     mem_wr = 0;
                     end
    STORE     :      begin
                     halt = 0;
                     load_ir = 0;
                     load_ac = aluopcode;
                     mem_rd = aluopcode;
                     load_pc = (opcode == JMP); 
                     inc_pc = (opcode == JMP);        
                     mem_wr = (opcode == STO);
                     end
    
    default: begin
        mem_rd  = 0;
        load_ir = 0;
        halt    = 0;
        load_ac = 0;
        load_pc = 0;
        inc_pc  = 0;
        mem_wr  = 0;
    end
    
    
    endcase
  end


  
endmodule
