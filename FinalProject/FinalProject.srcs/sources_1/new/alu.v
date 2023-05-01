`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:12:50 AM
// Design Name: 
// Module Name: alu
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


module alu(A,B,Op,Out,Z,N);

input [31:0] A;
input [31:0] B;
input [2:0] Op;
output reg [31:0] Out;
output reg Z;
output reg N;

always@(A,B,Op)
begin
    case(Op)
        3'b001: Out = B+(((~A)+1)); //B-A
        3'b010: Out = (~B)+1; //-B
        3'b100: Out = B+A; //B+A
        3'b111: Out = A; //A
    endcase
end

// Setting the zero and negative flags
always@(Out)
begin
    // Zero flag
    Z=0;
    if(Out==0)
        Z=1;
    // Negative flag
    N=0;
    if(Out[31]==1)
        N=1;
end

endmodule
