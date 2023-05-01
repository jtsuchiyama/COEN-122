`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:03:04 AM
// Design Name: 
// Module Name: test
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


module pc(clock, pc_in, pc_out);
input [31:0]pc_in;
output reg [31:0]pc_out;
input clock;

initial
begin
    pc_out = 0;
end

always@(posedge clock)
begin
    if (pc_in) 
    begin
        pc_out = pc_in;
    end
end

endmodule