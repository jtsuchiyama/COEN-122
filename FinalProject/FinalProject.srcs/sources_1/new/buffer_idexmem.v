`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:45:52 AM
// Design Name: 
// Module Name: buffer_idexmem
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


module idtoexmembuff(clk, RegWrtIn, SVPCIn, WAIIn, MemToRegIn, JumpIn, BranchNIn, BranchZIn, MemWriteIn, MemReadIn, AluOpIn, AluSrcIn, PCIn, Xrs1In, Xrs2In, ImmgenIn, RdIn, RegWrtOut, SVPCOut, WAIOut, MemToRegOut, JumpOut, BranchNOut, BranchZOut, MemWriteOut, MemReadOut, AluOpOut, AluSrcOut, PCOut, Xrs1Out, Xrs2Out, ImmgenOut, RdOut);

input clk;
input RegWrtIn, SVPCIn, WAIIn, MemToRegIn, JumpIn, BranchNIn, BranchZIn, MemWriteIn, MemReadIn, AluSrcIn;
input [2:0] AluOpIn;
input [31:0] PCIn, Xrs1In, Xrs2In, ImmgenIn;
input [5:0] RdIn;

output reg RegWrtOut, SVPCOut, WAIOut, MemToRegOut, JumpOut, BranchNOut, BranchZOut, MemWriteOut, MemReadOut, AluSrcOut;
output reg [2:0]AluOpOut;  
output reg [31:0] PCOut, Xrs1Out, Xrs2Out, ImmgenOut;
output reg [5:0] RdOut;

initial 
begin
    RegWrtOut = 0; 
    SVPCOut = 0; 
    WAIOut = 0;
    MemToRegOut = 0;
    JumpOut = 0;
    BranchNOut = 0;
    BranchZOut = 0;
    MemWriteOut = 0;
    MemReadOut = 0;
    AluOpOut = 0;
    AluSrcOut = 0;
    PCOut = 0;
    Xrs1Out = 0;
    Xrs2Out = 0;
    ImmgenOut = 0;
    RdOut = 0;
end

always@(posedge clk)
begin
    RegWrtOut = RegWrtIn; 
    SVPCOut = SVPCIn; 
    WAIOut = WAIIn;
    MemToRegOut = MemToRegIn;
    JumpOut = JumpIn;
    BranchNOut = BranchNIn;
    BranchZOut = BranchZIn;
    MemWriteOut = MemWriteIn;
    MemReadOut = MemReadIn;
    AluOpOut = AluOpIn;
    AluSrcOut = AluSrcIn;
    PCOut = PCIn;
    Xrs1Out = Xrs1In;
    Xrs2Out = Xrs2In;
    ImmgenOut = ImmgenIn;
    RdOut = RdIn;
end

endmodule