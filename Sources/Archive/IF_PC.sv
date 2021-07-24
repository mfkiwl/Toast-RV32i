`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2021 01:23:25 PM
// Design Name: 
// Module Name: PC
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
import RV32I_definitions ::*;

`ifdef CUSTOM_DEFINE
    `include "../defines.vh"
`endif

module PC

    `ifdef CUSTOM_DEFINE
        #(parameter REG_DATA_WIDTH = `REG_DATA_WIDTH,
          parameter IMEM_ADDR_WIDTH = `ADDR_DATA_WIDTH)  
    `else
        #(parameter REG_DATA_WIDTH = 32,
          parameter IMEM_ADDR_WIDTH = 10)
    `endif
    
    (
//*************************************************
    input                            Clk, 
    input                            Reset_n,       // synchronous active-low reset

//*************************************************
    input                            PC_Stall,
    input                            ID_Jump,
    input      [31:0]                ID_PC_dest,
    input                            EX_PC_Branch,
    input      [31:0]                EX_PC_Branch_dest,
    
//*************************************************   
    output reg [31:0]                PC_Out         // PC address
    
//*************************************************
    );

// ===========================================================================
//                    Parameters, Registers, and Wires
// ===========================================================================
    reg [31:0] PC_Next;

// ===========================================================================
//                              Implementation    
// ===========================================================================     
    initial begin
        PC_Out <= 0;
    end
    
    
    
    always@(posedge Clk) begin
        if(Reset_n == 1'b0) begin
            PC_Out <= 0;
        end
        else begin
            PC_Out <= PC_Next;          
        end
    end

    

endmodule