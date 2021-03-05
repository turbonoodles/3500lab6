`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 08:11:59 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk_100MHz,
    input reset,
    input enable,
    output [7:0] display_anodes,
    output [6:0] display_cathodes,
    output locked
    );

// digits for display
wire [3:0] tens_digit;
wire [3:0] ones_digit;

// clocking wizard DCM
clk_wiz_0 clockgen_5MHz(
    // Clock out ports
    .clk_5MHz(clk_5MHz),     // output clk_5MHz
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_100MHz(clk_100MHz)
);      // input clk_100MHz

// more clock division
wire clk_1Hz;
clock_divider clk_div_1Hz(
    .reset (0),
    .divisor (2500000),
    .clk_in (clk_5MHz),
    .clk_out (clk_1Hz)
);

wire clk_500Hz;
clock_divider clk_div_500Hz(
    .reset (0),
    .divisor (10000),
    .clk_in (clk_5MHz),
    .clk_out (clk_500Hz)
);

// dual BCD counter
wire nine; // high when the ones place is 9
counter_binary_0 ones_ctr (
    .CLK( clk_1Hz ),          // input wire CLK
    .THRESH0( nine ),  // output wire THRESH0
    .SCLR ( clear_ones ),
    .CE (enable),
    .Q(ones_digit)              // output wire [3 : 0] Q
);

wire ninety; 
counter_binary_0 tens_ctr (
    .CLK( clk_1Hz ),          // input wire CLK
    .THRESH0( ninety ),  // output wire THRESH0
    .SCLR ( clear_tens ),
    .CE ( nine) ,  
    .Q ( tens_digit )              // output wire [3 : 0] Q
);

// clear the counter back to zero when it reaches 99, or the reset is pushed
assign clear_tens = (nine & ninety) | reset;
assign clear_ones = nine | reset;

// dual seven-segment display
dual_sevenseg display(
    .clk ( clk_500Hz ),
    .tens ( tens_digit ),
    .ones ( ones_digit ),
    .cathodes ( display_cathodes ),
    .anodes ( display_anodes )
);

endmodule