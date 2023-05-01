`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2022 06:34:04 PM
// Design Name: 
// Module Name: sign_extender
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


module immgen(instr, immout);
    input [31:0] instr;
    output reg [31:0] immout;
    
    always @(instr) 
    begin
        case(instr[31:28])
        
        4'b0101: 
        begin
            immout[31:0] = {{26{instr[15]}}, instr[15:10]};
        end
        
        4'b1111: 
        begin
            immout[31:0] = {{20{instr[21]}}, instr[21:10]};
        end
        endcase
    end
endmodule