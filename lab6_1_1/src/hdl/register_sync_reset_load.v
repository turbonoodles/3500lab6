`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 12:20:37 PM
// Design Name: 
// Module Name: register_sync_reset_load
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


module register_sync_reset_load(
    input wire [3:0] D,
    input wire clk,
    input wire reset,
    input wire load,
    output reg [3:0] Q
    );

always @(posedge clk) 
    if (reset) 
        begin 
            Q <= 4'b0; 
        end else if (load) 
        begin 
            Q <= D; 
        end 

endmodule
