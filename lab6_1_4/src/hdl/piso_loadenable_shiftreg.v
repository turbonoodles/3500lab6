`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 03:01:13 PM
// Design Name: 
// Module Name: 4bpiso_loadenable_shiftreg
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


module piso_loadenable_shiftreg(
    input clk,
    input shiftIn,
    input [3:0] parallelIn,
    input load,
    input shiftEn,
    output shiftOut,
    output [3:0] regContent
    );

reg [3:0] shiftReg;

always @(posedge clk) begin
    if (load)
        shiftReg <= parallelIn;
    else if (shiftEn)
        shiftReg <= { shiftReg[2], shiftReg[1], shiftReg[0], shiftIn };
end

assign shiftOut = shiftReg[3];
assign regContent = shiftReg[3:0];

endmodule
