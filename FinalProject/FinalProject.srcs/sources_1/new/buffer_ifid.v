`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:56:03 AM
// Design Name: 
// Module Name: buffer_ifid
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


module iftoidbuff(clk, PCIn, InstrIn, PCOut, InstrOut);

input clk;
input [31:0] PCIn, InstrIn;
output reg [31:0] PCOut, InstrOut;

initial
begin 
    PCOut = 0;
    InstrOut = 0;
end

always@(posedge clk)
begin
    PCOut = PCIn;
    InstrOut = InstrIn;
end

endmodule