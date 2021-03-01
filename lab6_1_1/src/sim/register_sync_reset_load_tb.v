`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 12:25:46 PM
// Design Name: 
// Module Name: register_sync_reset_load_tb
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


module register_sync_reset_load_tb(

    );

reg clk;
reg [3:0] D;
reg reset, load;
wire [3:0] Q;

// instantiate device under test
register_sync_reset_load dut(
    .clk (clk),
    .Q (Q),
    .D (D),
    .reset (reset),
    .load (load)
);

initial begin
    clk = 0;
    D = 0;
    load = 0;
    reset = 0;

    // set the data word to B and load
    #10;
    D = 4'hB;
    #2;
    load = 1;
    #2;
    load = 0;
    $display("Expect: 0xBEEF. Got: %h", Q);
    
    // reset
    #10;
    reset = 1;
    #2;
    $display("Expect: 0. Got: #d", Q);
    
    $finish;
end

always begin
    #1;
    clk = ~clk; // clock generation
end

endmodule
