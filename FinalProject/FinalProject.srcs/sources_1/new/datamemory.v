`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2022 10:20:22 AM
// Design Name: 
// Module Name: datamemory
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


module data(clock, memWrite, memRead, address, WD, RD);
//initialization of variables
input clock;
input memWrite; // control selector determining write to data operation
input memRead;  // control selector determining read from data operation

// 2-d array for internal data representation
reg [31:0] data[65535:0];

input [31:0] address;
input [31:0] WD; // write to data input

output reg [31:0] RD; // read from data output

//integer i;
//initial
//begin
//    for (i = 0; i < 65536; i = i + 1)
//    begin
//        data[i] = 0;
//    end
//end

initial
begin
    data[0] = 0;
    data[2] = 3;
    data[3] = -4;
    data[4] = 5;
    data[5] = 2;
    data[6] = 20;
end

// at positive edge of clock, update the output
always@(negedge clock)
begin
    // use address to index into the data memory to read the desired data if control selector is 1
    if (memRead == 1)
        RD = data[address[15:0]];
    // use address to index into the data memory to write the desired data if control selector is 1
    if (memWrite == 1)
        data[address[15:0]] = WD;
end
endmodule