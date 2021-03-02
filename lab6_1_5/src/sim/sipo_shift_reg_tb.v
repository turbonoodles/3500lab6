`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 04:08:27 PM
// Design Name: 
// Module Name: sipo_shift_reg_tb
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


module sipo_shift_reg_tb(

    );

reg clk;
reg shiftIn;
reg shiftEn;
wire shiftOut;
wire [3:0] parallelOut;

sipo_shift_reg dut(
    .clk (clk),
    .shiftIn (shiftIn),
    .shiftEn (shiftEn),
    .shiftOut (shiftOut),
    .parallelOut (parallelOut)
);

initial begin
    clk = 0;
    shiftIn = 1;
    shiftEn = 0;
    #10; // ignore several shifts
    shiftEn = 1;
    #10; // should shift all the way
    $display("Shift test 1: Expect 15, got %d", parallelOut);
    shiftEn = 0;
    #5;
    shiftIn = 0;
    #5;
    $display("Retention test: Expect 15, got %d", parallelOut);
    shiftEn = 1;
    #10;
    $display("Shift test 2: Expect 0, got %d", parallelOut);
    #5;
    $finish;
end

always begin
    #1;
    clk = ~clk;
end
endmodule
