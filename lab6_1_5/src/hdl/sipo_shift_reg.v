`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 04:02:07 PM
// Design Name: 
// Module Name: sipo_shift_reg
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


module sipo_shift_reg(
    input wire clk,
    input wire shiftIn, // next serial bit
    input wire shiftEn, // shift input enable
    output wire shiftOut,
    output wire [3:0] parallelOut
    );

reg [3:0] shiftReg = 0;

always @(posedge clk) begin
    
    if (shiftEn) begin
        shiftReg = { shiftReg[2:0], shiftIn};
    end

end

assign shiftOut = shiftReg[3];
assign parallelOut = shiftReg[3:0];

endmodule
