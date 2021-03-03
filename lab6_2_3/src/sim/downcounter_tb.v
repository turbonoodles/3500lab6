`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 07:43:47 PM
// Design Name: 
// Module Name: downcounter_tb
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


module downcounter_tb(
    );

reg clk;
reg enable;
reg clear;
reg load;

wire [3:0] q;

downcounter dut(
    .clk (clk),
    .enable (enable),
    .clear (clear),
    .load (load),
    .q (q)
);

initial begin
    clk = 0;
    enable = 0;
    clear = 1;
    load = 0;
    #2;
    clear = 0;
    #2; // cleared so we definitely start at 0
    
    load = 1; 
    #1;
    load = 0;
    #1; // load ignored because disabled

    enable = 1;
    #23; // little over two full cycles I think
    clear = 1;
    #1;
    clear = 0; // clear the counter

    #15;
    load = 1;
    #1;
    load = 0; // test force-load
    #25;
    $finish;
end

always begin
    #1;
    clk = ~clk;
end

endmodule
