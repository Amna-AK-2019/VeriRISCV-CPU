`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Amna Arshad Khan
// Create Date: 08/27/2025 09:34:14 PM
// Design Name: 
// Module Name: cpu
// Project Name: Veri RISC CPU
//// Description: 
// The concepts that are used in this code to make a small workinf CPU.
    //1. Modules & hierarchy
    //2. Logic data types, typedefs, enums
    //3. always_ff / always_comb separation
    //4. Blocking vs Non-blocking assignments
    //5. FSM design (controller)
    //6. Memory modeling with arrays, packed and unpacked arrays
    //7. Registers and counters
    //8. Multi-clock handling
    //9. Packages & import
   
 //The work flow of CPU is as follows:
// ? CPU Workflow in Steps
//PC ? Memory ? Fetch instruction.
//Instruction Register ? Decode.
//Control Signals + ALU/Register File/Memory ? Execute.
//Result ? Register File or Memory (if required).
//Update PC and repeat.


//////////////////////////////////////////////////////////////////////////////////

module cpu (
    output logic halt, load_ir,  
    input  logic clk, rst, fetch, control_clk, alu_clk
    );


import opcodes::*;
logic    [7:0]   data, alu_out, accum, ir_out;
logic    [4:0]   pc_out, ir_addr, mux_addr;
opcode_t   opcode;
logic load_ac, mem_rd, mem_wr, inc_pc, load_pc, zero;

//datapath connections

assign opcode = opcode_t'(ir_out[7:5]);
assign ir_addr = ir_out[4:0];

register accumulator (.out (accum),
                    .data_in (alu_out),
                    .clk,
                    .enable (load_ac),
                    .rst
                    );
        
controller controller1 (
//.load_ac,
//                .mem_rd,
//                .mem_wr,
//                .inc_pc,
//                .load_pc,
//                .load_ir,
//                .halt,
//                .opcode,
//                .zero,
//                .clk(control_clk),
//                .rst,
    .load_ac (load_ac),
    .mem_rd  (mem_rd),
    .mem_wr  (mem_wr),
    .inc_pc  (inc_pc),
    .load_ir (load_ir),
    .halt    (halt),
    .opcode  (opcode),
    .zero    (zero),
    .clk     (control_clk),
    .rst     (rst)
                );

//register ins_reg (.out (ir_out),
//                 .data,          
//                 .clk,
//                 .enable (load_ir),
//                 .rst
//                 ); 
    register ins_reg (
        .out     (ir_out),
        .data_in (data),
        .clk     (clk),
        .enable  (load_ir),
        .rst     (rst)
    );

counter  pc     (.count (pc_out),
                .data (ir_addr),
                .clk,
                .load_pc (load_pc),
                .enable (inc_pc),
                .rst
                );

alu  alu1      (.out (alu_out),
                .zero,
                .clk(alu_clk) ,
                .accum,
                .data(data), 
                .opcode
               );

mux mux1       ( .out (mux_addr),
                .in_a (pc_out),
                .in_b (ir_addr),
                .fetch 
               );

memory memory1  (.clk(~control_clk),
                .read (mem_rd),
                .write (mem_wr), 
                .addr(mux_addr)  ,
                .data_in(alu_out),
                .data_out(data)
                );                      

endmodule
