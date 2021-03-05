`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 08:26:48 AM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk_in,
    input reset,
    input [22:0] divisor,
    output reg clk_out
    );

reg [22:0] count = 0;

always @( posedge clk_in, posedge reset ) begin

    if (reset) begin
        count <= divisor;
        clk_out <= 0;
    end

    else begin// not resetting
        if ( count == 0 ) begin
            // terminal count reached
            count <= divisor;
            clk_out <= 1;
        end
        else if ( count == ( divisor - 1) ) begin
            clk_out <= 0; // go high for one clock cycle
        end
        else begin
            // normal decrement
            count <= count - 1;
        end
    end
    
end

endmodule
