`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2022 10:10:22 AM
// Design Name: 
// Module Name: adder1
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


module adder1bit(a,b,c_in,c_out,sum);
input a, b, c_in;
output sum, c_out;

assign sum = a ^ b ^ c_in;
assign c_out =  (a & b) | (a & c_in) | (b & c_in);

endmodule