`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:06:18 PM
// Design Name: 
// Module Name: 4bpiso_loadenable_shiftreg_tb
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


module piso_loadenable_shiftreg_tb(
    );

// inputs to DUT
reg clk;
reg [3:0] parallelIn;
reg load;
reg shiftEn;
reg shiftIn;

// DUT outputs
wire shiftOut;
wire [3:0] regContent;

// DUT Initialization
piso_loadenable_shiftreg dut(
    .clk (clk),
    .parallelIn (parallelIn),
    .load (load),
    .shiftEn (shiftEn),
    .shiftIn (shiftIn),
    .regContent (regContent),
    .shiftOut (shiftOut)
);

initial begin
    clk = 0;
    parallelIn = 15;
    load = 0;
    shiftEn = 0;
    shiftIn = 0;

    // load the register with 1s
    #5;
    load = 1; #1; load = 0;
    #5;
    // this should be over before start shifting zeros
    #20; // don't enable yet; miss several zeros
    shiftEn = 1;
    #10;
    $finish;
end

// clock generator
always begin
    #1;
    clk = ~clk;
end


endmodule
