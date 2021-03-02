`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:38:14 PM
// Design Name: 
// Module Name: delay_line3_tb
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


module delay_line3_tb(
    );

reg clk;
reg shiftIn;
wire shiftOut;

delay_line3 dut(
    .shiftIn (shiftIn),
    .shiftOut (shiftOut),
    .clk (clk)
);

initial begin
    clk = 0;
    shiftIn = 0;
    #100;
    $finish;
end

always begin
    #1;
    clk = ~clk;
end

always begin
    #9;
    shiftIn = ~shiftIn;
end

endmodule
