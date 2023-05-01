`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 02:26:24 PM
// Design Name: 
// Module Name: instmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: instmem.v represents the instruction memory unit module. Given
//              an address, it outputs the instructions. It is sequential module
//              and requires a clock.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instmem(clock, address, inst);
//initialization of variables
input clock;
input [31:0]address;
output reg [31:0]inst;

// 2-d array for instructions inside the module
wire[31:0] instr[255:0];

// demo
assign instr[0] = 32'b01110000000000000000000000000000; // sub x0, x0, x0
assign instr[1] = 32'b00000000000000000000000000000000; // nop
assign instr[2] = 32'b01010101000000001000000000000000; // addi x20, x0, -65535
assign instr[3] = 32'b01000001010000100000110000000000; // add x5, x2, x3
assign instr[4] = 32'b00000000000000000000000000000000; // nop
assign instr[5] = 32'b11110010010000000000100000000000; // SVPC x9, 2
assign instr[6] = 32'b11110010100000000010000000000000; // SVPC x10, 8
assign instr[7] = 32'b11100001100000100000000000000000; // LD x6, x2
assign instr[8] = 32'b00000000000000000000000000000000; // nop
assign instr[9] = 32'b00000000000000000000000000000000; // nop
assign instr[10] = 32'b01110001110001100101000000000000; // sub x7, x6, x20
assign instr[11] = 32'b10110000000010100000000000000000; // BRN X10
assign instr[12] = 32'b00000000000000000000000000000000; // nop
assign instr[13] = 32'b00000000000000000000000000000000; // nop
assign instr[14] = 32'b00000000000000000000000000000000; // nop
assign instr[15] = 32'b01000101000001100000000000000000; // add x20, x6, x0
assign instr[16] = 32'b01010000100000100000010000000000; // addi x2, x2, 1
assign instr[17] = 32'b00000000000000000000000000000000; // nop
assign instr[18] = 32'b01110001110000100001010000000000; // sub x7, x2, x5
assign instr[19] = 32'b10110000000010010000000000000000; // BRN X9
assign instr[20] = 32'b00000000000000000000000000000000; // nop
assign instr[21] = 32'b00000000000000000000000000000000; // nop
assign instr[22] = 32'b01010101000101000000000000000000; // addi x20, x20, 0
assign instr[23] = 32'b10100000010000000000000000000000; // wai x1
assign instr[24] = 32'b00110000000000100101000000000000; // ST x2, x20
assign instr[25] = 32'b01110000100000100000100000000000; // sub x2, x2, x2
assign instr[26] = 32'b10000000000101000000000000000000; // jump x20

//assign instr[28] = 32'b01110000100000100000100000000000; // sub x2, x2, x2
//assign instr[29] = 32'b10010000001000010000000000000000; // BRZ X33
//assign instr[30] = 32'b00000000000000000000000000000000; // nop
//assign instr[31] = 32'b00000000000000000000000000000000; // nop
//assign instr[32] = 32'b00000000000000000000000000000000; // nop



//assign instr[26] = 32'b00000000000000000000000000000000; // nop
//assign instr[27] = 32'b00000000000000000000000000000000; // nop
//assign instr[28] = 32'b00000000000000000000000000000000; // nop
//assign instr[29] = 32'b10100000100000000000000000000000; // wai x2


//assign instr[29] = 32'b00110000000000100101000000000000; // ST x2, x20
//assign instr[30] = 32'b10000000000111110000000000000000; // jump x31
//assign instr[31] = 32'b00000000000000000000000000000000; // nop


//manually assigning values for Basic Pipelin testing -- includes nops

// svpc test
//assign instr[0] = 32'b11110010010000000000100000000000; // SVPC x9, 2

// add test 
//assign instr[0] = 32'b01000001010000100000110000000000; // add x5, x2, x3

// wai test
//assign instr[0] = 32'b10100010110000000000000000000000; // wai x11
//assign instr[1] = 32'b00000000000000000000000000000000;  // nop
//assign instr[2] = 32'b10100010110000000000000000000000; // wai x11

// jump test
//assign instr[0] = 32'b10000000000010100000000000000000;  // Jump x10
//assign instr[10] = 32'b00000000000000000000000000000000;  // nop



// brz test
//assign instr[0] = 32'b01110001000000000000010000000000;  //sub x4,x0, x1; x4 = 1 - 1 = 0
//assign instr[1] = 32'b10010000000001100000000000000000;  // BRZ x6
//assign instr[6] = 32'b00000000000000000000000000000000;  // nop

// brn + wai test
//assign instr[0] = 32'b01110001000000110001000000000000;  //sub x4,x0, x1
//assign instr[1] = 32'b10110000000010010000000000000000;  // BRN x9
//assign instr[10] = 32'b11110010100000000001000000000000;  //x10 = PC+4

//assign instr[0] = 32'b01000001000001000001000000000000;  //add x4,x4,x4; x4 = 4 + 4 = 8
//assign instr[1] = 32'b01110001010001100000110000000000;  //sub x5,x6,x3; x6 = 6 - 3 = 3
//assign instr[1] = 32'b01000001000001000001000000000000;  //add x4,x4,x4
//assign instr[1] = 32'b01010001000001001000000000000000;  //inc x4,x4,-32
//assign instr[0] = 32'b01000001010000100000110000000000;  //add x5,x2,x3
//assign instr[1] = 32'b11110010010000010000000000000000;  //x9 = PC+1
//assign instr[2] = 32'b11110010100001000000000000000000;  //x10 = PC+4
//assign instr[1] = 32'b11100001100000100000000000000000;  // x6 = mem[x2]
//assign instr[2] = 32'b00000000000000000000000000000000;  // nop
//assign instr[3] = 32'b00000000000000000000000000000000;  // nop
//assign instr[4] = 32'b01110001110001100001000000000000;  // sub x7,x6,x4
//assign instr[5] = 32'b10000000000010100000000000000000;  // Jump x10
//assign instr[6] = 32'b00000000000000000000000000000000;  // nop
//assign instr[7] = 32'b00000000000000000000000000000000;  // nop
//assign instr[8] = 32'b01000001000001100000010000000000;  // add x4,x6,x1; x1 = 0
//assign instr[9] = 32'b01010000100000100000010000000000;  // inc x2,x2,1
//assign instr[10] = 32'b01110010000000100001010000000000;  // sub x8,x2,x5 index - 19
//assign instr[11] = 32'b10110000000010010000000000000000;  // BRN x9
//assign instr[12] = 32'b00000000000000000000000000000000; // nop

//manually assigning values for Advanced Pipeline testing - has no nops due to advanced hazard handling
//assign instr[0] = 32'b01000001010000100000110000000000;  //add x5,x2,x3
//assign instr[1] = 32'b11100001100000100000000000000000;  // x6 = mem[x2]
//assign instr[4] = 32'b01110001110001100001000000000000;  // sub x7,x6,x4
//assign instr[5] = 32'b10110000000010100000000000000000;  // BRN x10
//assign instr[8] = 32'b01000001000001100000010000000000;  // add x4,x6,x1; x1 = 0
//assign instr[9] = 32'b01010000100000100000010000000000;  // inc x2,x2,1
//assign instr[10] = 32'b01110010000000100001010000000000;  // sub x8,x2,x5 index - 19
//assign instr[11] = 32'b10110000000010010000000000000000;  // BRN x9

// manually initializing for MAX instruction test
//assign instr[0] = 32'b00000000000000000000000000000000;  // nop
//assign instr[1] = 32'b00000000000000000000000000000000;  // nop
//assign instr[2] = 32'b00010001000000100000110000000000; // MAX x4, x2,x3

// on positive edge of clock will consume an address and outputs the instructions at that address
always@(negedge clock)
begin
    inst = instr[address];
end
endmodule