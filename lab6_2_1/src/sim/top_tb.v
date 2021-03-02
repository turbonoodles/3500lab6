`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 04:55:14 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(
    );

reg clk;
reg enable;
reg clear;
wire [7:0] Q;

top dut(
    .enable (enable),
    .clk (clk),
    .clear (clear),
    .Q (Q)
);

initial begin
    clk = 0;
    clear = 1;
    enable = 0; // don't start counting yet
    #10;
    enable = 1;

    // clear the counter
    clear = 0;
    #1;
    clear = 1;
    #1;

    // run for a bit
    #255; // should reach 0x7f
    clear = 1;
    #1;
    clear = 0;
    #26;
    enable = 0;
    #26;
    enable = 1;
    clear = 0; // conflicting clear/enable; should not count
    #26;
    
    $finish;



end

always begin
    #1; clk = ~clk;
end

endmodule
