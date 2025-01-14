`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 01:21:19 PM
// Design Name: 
// Module Name: EX_alu
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
`ifdef CUSTOM_DEFINE
    `include "defines.vh"
`endif

module toast_alu
    `include "toast_definitions.vh"
    (
    output reg  [31:0]     alu_result_o, 

    input  wire [3:0]      alu_ctrl_i,  // controls ALU operation for current instrn
    input  wire [31:0]     alu_op1_i,   // operand 1
    input  wire [31:0]     alu_op2_i    // operand 2
    );

    // shamt -> alu_op2[4:0] 
   
    always@* begin
        // DEFAULT
        alu_result_o = 0;

        case(alu_ctrl_i)
            // arithmetic
            `ALU_ADD:  alu_result_o = alu_op1_i + alu_op2_i;
            `ALU_SUB:  alu_result_o = alu_op1_i - alu_op2_i;
            `ALU_AND:  alu_result_o = alu_op1_i & alu_op2_i;
            `ALU_OR:   alu_result_o = alu_op1_i | alu_op2_i;
            `ALU_XOR:  alu_result_o = alu_op1_i ^ alu_op2_i;
            
            //shifts
            `ALU_SLL:  alu_result_o = alu_op1_i << alu_op2_i[4:0]; 
            `ALU_SRL:  alu_result_o = alu_op1_i >> alu_op2_i[4:0]; 
            `ALU_SRA:  alu_result_o = $signed(alu_op1_i) >>> alu_op2_i[4:0]; 
            
            // test
            `ALU_SEQ:  alu_result_o = (alu_op1_i == alu_op2_i) ? 1:0; 
            `ALU_SLT:  alu_result_o = ($signed(alu_op1_i) < $signed(alu_op2_i)) ? 1:0; 
            `ALU_SLTU: alu_result_o = (alu_op1_i < alu_op2_i) ? 1:0; 

            default: alu_result_o = 0;
        endcase
    end
    
endmodule
