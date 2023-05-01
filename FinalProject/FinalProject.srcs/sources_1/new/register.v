`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 02:14:53 PM
// Design Name: 
// Module Name: lab3
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

module register(clock,write,rs1,rs2,rd,datain,rs1_out,rs2_out);
    input clock, write;
    input [5:0] rs1;
    input [5:0] rs2;
    input [5:0] rd;
    input [31:0] datain;
    reg [31:0] registers [63:0];
    output reg [31:0] rs1_out;
    output reg [31:0] rs2_out;
    
    initial
    begin
        registers[0] = 0;
        registers[2] = 2; // starting point in memory
        registers[3] = 4; // number of items n - 
        registers[20] = -100000; // MAX
    end
    
    always@(negedge clock)
    begin
        rs1_out = registers[rs1];
        rs2_out = registers[rs2];
    end
    
    always@(negedge clock)
    begin
         if(write == 1)
            registers[rd] = datain; 
    end
  
endmodule