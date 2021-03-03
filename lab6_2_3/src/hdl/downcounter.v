`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 07:37:33 PM
// Design Name: 
// Module Name: downcounter
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


module downcounter(
    input load,
    input enable,
    input clear,
    input clk,
    output reg [3:0] q
    );

parameter MAX_COUNT = 4'b1010;

always @(posedge clk) begin
    
    if (clear)
        q <= 0;
        
    else if (enable) begin
        if ( q == 0 | load )
            q <= MAX_COUNT;
        else
            q <= q - 1;
    end
end

endmodule
