`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:34:10 PM
// Design Name: 
// Module Name: delay_line3
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


module delay_line3(
    input clk,
    input shiftIn,
    output shiftOut
    );

reg [2:0] shiftReg;

always @(posedge clk)
    shiftReg <= { shiftReg[1:0], shiftIn};

assign shiftOut = shiftReg[2];

endmodule
