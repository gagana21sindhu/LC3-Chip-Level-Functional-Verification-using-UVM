//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains defines and typedefs to be compiled for use in
// the simulation running on the emulator when using Veloce.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
                                                                               
typedef bit [15:0] pc_t;
typedef enum bit [3:0] {ADD=4'b0001, AND=4'b0101, NOT=4'b1001, LD=4'b0010, LDR=4'b0110, LDI=4'b1010, LEA=4'b1110, ST=4'b0011, STR=4'b0111, STI=4'b1011, BR=4'b0000, JMP=4'b1100} opcode_t;
typedef enum bit [2:0] {R0 = 0,R1 = 1,R2 = 2,R3 = 3,R4 = 4,R5 = 5,R6 = 6,R7 = 7} reg_t;
typedef bit [8:0] pcoffset9_t;
typedef bit [5:0] pcoffset6_t;
typedef bit [4:0] imm5_t;
typedef bit imm_en_t;
typedef bit [15:0] instr_dout_t;
typedef bit [2:0] nzp_t;
typedef bit instrmem_rd_t;
typedef bit complete_instr_t;

typedef bit [15:0] bit_16;

/*parameter 	ADD = 4'd1,
			AND = 4'd5,
			NOT = 4'd9,
			BR = 4'd0,
			JMP = 4'd12,
			LD = 4'd2,
			LDR = 4'd6,
			LDI = 4'd10,
			LEA = 4'd14,
			ST = 4'd3,
			STR = 4'd7,
			STI = 4'd11 ;*/

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

