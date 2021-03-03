`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 09:16:38 PM
// Design Name: 
// Module Name: lab2_2_1_partA
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


module lab2_2_1_partA(
    input wire [3:0] v, // input value
    output wire z, // most significant bit
    output wire [3:0] m_out // output number
    );

// comparator
assign z = ( v > 9 ); // select alternate if  doesn't BCD

// circuit a
// I guess this just subtracts ten
wire [3:0] a;
assign a = v - 10;

// multiplexer
// if it doesn't bcd, use the one where we subtract 10
assign m_out = z? a:v;

endmodule