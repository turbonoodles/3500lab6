`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 11:05:11 PM
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

reg clk_100MHz;
reg [3:0] val;
wire [6:0] cathodes;
wire [7:0] anodes;

top dut(
    .clk_100MHz (clk_100MHz),
    .val (val),
    .cathodes (cathodes),
    .anodes (anodes)
);

initial begin
    clk_100MHz = 0;
    val = 4'hA;

    #5000000;
    $finish;
end

always begin
    #5; clk_100MHz = ~clk_100MHz; // 100MHz clock
end

endmodule
