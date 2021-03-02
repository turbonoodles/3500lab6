`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 04:32:44 PM
// Design Name: 
// Module Name: flipflop
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


module flipflop(
    input d,
    input clk,
    input clr_n,
    output q, q_n
    );

reg str;

always @(posedge clk, negedge clr_n) 
begin
    if (!clr_n)
        str <= 0;
    else
        str <= d;
end

assign q = str;
assign q_n = ~str;

endmodule