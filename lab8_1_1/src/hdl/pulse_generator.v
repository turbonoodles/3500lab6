`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 08:14:46 PM
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator(
    input wire clk_100MHz,
    input wire reset,
    input wire enable,
    output reg pulse_1s,
    output dcm_lock
    );

// IP Catalog clocking wizard instantiation
clk_wiz_0 instance_name(
    // Clock out ports
    .clk_out1(clk_5MHz),     // output clk_out1
    // Status and control signals
    .locked(dcm_lock),       // output locked
   // Clock in ports
    .clk_in1(clk_100MHz)
);      // input clk_in1

// still got 5MHz, need to divide by 5M to get 1s pulses
parameter divisor = 5000000;
reg [22:0] count; // 2^23 = 8M

always @(posedge clk_5MHz, posedge reset) begin

    // asynchronous reset
    // seems like it might be annoying to hold BTNU
    if (reset) begin
        count <= divisor;
        pulse_1s <= 0;
    end

    else if (enable) begin // not resetting
        if ( count == 0 ) begin
            // reached terminal count, reload
            pulse_1s <= ~pulse_1s;
            count <= divisor - 1; // decrement on every count for accuracy
        end
        else begin
            // normal cycle, just decrement the count
            count <= count - 1;
        end
    end

end


endmodule
