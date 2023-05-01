`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:44:27 AM
// Design Name: 
// Module Name: buffer_exmemwb
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


module exmemtowbbuff(clk, RegWrtIn, SVPCIn, WAIIn, MemToRegIn, PCIn, PCAddIn, NegIn, ZeroIn,  AluResultIn, MemReadDataIn, RdIn, RegWrtOut, SVPCOut, WAIOut, MemToRegOut, PCOut, PCAddOut, NegOut, ZeroOut, AluResultOut, MemReadDataOut, RdOut);

input clk;

input RegWrtIn, SVPCIn, WAIIn, MemToRegIn, NegIn, ZeroIn; 
input [31:0] PCIn, PCAddIn, AluResultIn, MemReadDataIn; 
input [5:0] RdIn;

output reg RegWrtOut, SVPCOut, WAIOut, MemToRegOut, NegOut, ZeroOut; 
output reg [31:0] PCOut, PCAddOut, AluResultOut, MemReadDataOut; 
output reg [5:0] RdOut;

initial
begin
    RegWrtOut = 0; 
    SVPCOut = 0;
    WAIOut = 0; 
    MemToRegOut = 0; 
    PCOut = 0; 
    PCAddOut = 0; 
    NegOut = 0;
    ZeroOut = 0; 
    AluResultOut = 0;
    MemReadDataOut = 0;
    RdOut = 0;
end

always@(posedge clk)
begin
    RegWrtOut = RegWrtIn; 
    SVPCOut = SVPCIn;
    WAIOut = WAIIn; 
    MemToRegOut = MemToRegIn; 
    PCOut = PCIn; 
    PCAddOut = PCAddIn; 
    NegOut = NegIn;
    ZeroOut = ZeroIn; 
    AluResultOut = AluResultIn;
    MemReadDataOut = MemReadDataIn;
    RdOut = RdIn;
end

endmodule