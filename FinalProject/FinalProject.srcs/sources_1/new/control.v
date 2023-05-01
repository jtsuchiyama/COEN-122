`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2022 10:11:01 AM
// Design Name: 
// Module Name: control
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


module Control_final(clk, Op, RegWrt, SVPC, WAI, MemToReg, BranchN, BranchZ, Jump, MemWrite, MemRead, AluSrc, AluOp);

input clk;
input [3:0] Op;

output reg RegWrt; 
output reg SVPC;
output reg WAI; 
output reg MemToReg;
output reg BranchN;
output reg BranchZ;
output reg Jump;
output reg MemRead; 
output reg MemWrite; 
output reg AluSrc;
output reg[2:0] AluOp; 

always@(Op)
begin
    case(Op)
    //NOP
    4'b0000:
    begin
        RegWrt = 0;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 0;
    end

    //SVPC
    4'b1111:
    begin
        RegWrt = 1;
        SVPC = 1;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 1;
        AluOp = 3'b000;
    end

    //Load
    4'b1110:
    begin
        RegWrt = 1;
        SVPC = 0;
        WAI = 0;
        MemToReg = 1;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 1;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b000;
     end

     //store
     4'b0011:
     begin
        RegWrt = 0;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 1;
        AluSrc = 0;
        AluOp = 3'b000;
     end

     //Add
     4'b0100:
     begin
        RegWrt = 1;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b100;
     end 

     //Addi
     4'b0101:
     begin
        RegWrt = 1;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 1;
        AluOp = 3'b100;
     end 

     //Negate
     4'b0110:
     begin
        RegWrt = 1;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b010;
     end 

     //Subtract
     4'b0111:
     begin
        RegWrt = 1;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b001;
     end 

     //Jump
     4'b1000:
     begin
        RegWrt = 0;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 1;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b000;
     end

     //BRZ
     4'b1001:
     begin
        RegWrt = 0;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 1;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b000;
     end

     //BRN
     4'b1011:
     begin
        RegWrt = 0;
        SVPC = 0;
        WAI = 0;
        MemToReg = 0;
        BranchN = 1;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b000;
     end
     
     //WAI
     4'b1010:
     begin
        RegWrt = 1;
        SVPC = 1;
        WAI = 1;
        MemToReg = 0;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        MemRead = 0;
        MemWrite = 0;
        AluSrc = 0;
        AluOp = 3'b000;
     end
     endcase
end
endmodule
