`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2022 10:09:36 AM
// Design Name: 
// Module Name: adder32bit
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


module adder32bit(a,b,out);
input [31:0]a;
input [31:0]b;
output [31:0]out;

reg c_in = 0;
wire [31:0]c_out; 

adder1bit adder1(a[0], b[0], c_in, c_out[0], out[0]);
adder1bit adder2(a[1], b[1], c_out[0], c_out[1], out[1]);
adder1bit adder3(a[2], b[2], c_out[1], c_out[2], out[2]);
adder1bit adder4(a[3], b[3], c_out[2], c_out[3], out[3]);
adder1bit adder5(a[4], b[4], c_out[3], c_out[4], out[4]);
adder1bit adder6(a[5], b[5], c_out[4], c_out[5], out[5]);
adder1bit adder7(a[6], b[6], c_out[5], c_out[6], out[6]);
adder1bit adder8(a[7], b[7], c_out[6], c_out[7], out[7]);
adder1bit adder9(a[8], b[8], c_out[7], c_out[8], out[8]);
adder1bit adder10(a[9], b[9], c_out[8], c_out[9], out[9]);
adder1bit adder11(a[10], b[10], c_out[9], c_out[10], out[10]);
adder1bit adder12(a[11], b[11], c_out[10], c_out[11], out[11]);
adder1bit adder13(a[12], b[12], c_out[11], c_out[12], out[12]);
adder1bit adder14(a[13], b[13], c_out[12], c_out[13], out[13]);
adder1bit adder15(a[14], b[14], c_out[13], c_out[14], out[14]);
adder1bit adder16(a[15], b[15], c_out[14], c_out[15], out[15]);
adder1bit adder17(a[16], b[16], c_out[15], c_out[16], out[16]);
adder1bit adder18(a[17], b[17], c_out[16], c_out[17], out[17]);
adder1bit adder19(a[18], b[18], c_out[17], c_out[18], out[18]);
adder1bit adder20(a[19], b[19], c_out[18], c_out[19], out[19]);
adder1bit adder21(a[20], b[20], c_out[19], c_out[20], out[20]);
adder1bit adder22(a[21], b[21], c_out[20], c_out[21], out[21]);
adder1bit adder23(a[22], b[22], c_out[21], c_out[22], out[22]);
adder1bit adder24(a[23], b[23], c_out[22], c_out[23], out[23]);
adder1bit adder25(a[24], b[24], c_out[23], c_out[24], out[24]);
adder1bit adder26(a[25], b[25], c_out[24], c_out[25], out[25]);
adder1bit adder27(a[26], b[26], c_out[25], c_out[26], out[26]);
adder1bit adder28(a[27], b[27], c_out[26], c_out[27], out[27]);
adder1bit adder29(a[28], b[28], c_out[27], c_out[28], out[28]);
adder1bit adder30(a[29], b[29], c_out[28], c_out[29], out[29]);
adder1bit adder31(a[30], b[20], c_out[29], c_out[30], out[30]);
adder1bit adder32(a[31], b[31], c_out[30], c_out[31], out[31]);

endmodule