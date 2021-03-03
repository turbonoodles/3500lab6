`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 09:57:19 PM
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
    input wire clk_100MHz, // clock input to DCM
    input wire [3:0] val,
    output reg [6:0] cathodes, // seven segment display cathodes
    output reg ten,
    output reg [7:0] anodes
    );

// main clock divider from clocking wizard
clk_wiz_0 clocky(
    // Clock out ports
    .clk_out1(clk_5MHz),     // output clk_out1
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_100MHz)
);      // input clk_in1

// divide 5MHz clock down to 500Hz
parameter divisor = 10000;
reg [15:0] count = 0;
always @(posedge clk_5MHz) begin
    if (count == 0) begin
        count <= divisor - 1;
        clk_500Hz <= ~clk_500Hz;
    end
    else count <= count - 1;
end

/*  BLOCK DIAGRAM              ############                 Anodes   8
#################     ten      # Mux      #             |------------/-----------------------------------|
# Number Thing  # ------------ # 1 if ten #---          |                                             DISPLAY
#               #              # 0 if not #  |    ##############          ###############                a   .....
#               #  bcd_digit   ############   ----# Kinda-mux  #     4    # BCD-to-7s   #  cathodes    f   b .....
#               # -----/--------------------------# bcd_digit  #-----/----# decoder     # ---/---------  g   .....
#################      4                          # | ten?     #          #             #    7         e   c .....
                                                  ##############          ###############                d   .....
                                                [ this thing is 
                                                 driven by the FSM
                                                 but I don't want to 
                                                 draw that ]
*/

// somewhere for the digit to transfer over
wire [3:0] bcd_digit;
// need to transfer the decoded digit into the logic too now
wire [6:0] seg0;

lab2_2_1_partA numberthing(
    .v (val),
    .z (ten),
    .m_out (bcd_digit)
);

bcdto7segment_dataflow decoder (
    .bcd_in (digit),
    .seg (cathodes)
);

// Simple FSM for the anode driver
// state definition
parameter lsd = 1;
parameter msd = 2;

// next state logic, encoded like anodes
reg [7:0] next_state;
reg [7:0] state;

always @(state) begin
    case (state)
    // we just want to switch between digits
        lsd: next_state <= msd;
        msd: next_state <= lsd;
        default: next_state <= 0; // trap broken state
    endcase
end

always @(posedge clk_500Hz) begin
    
    // advance the state machine
    state <= next_state;

    // drive the display outputs
    case (state)
        // kinda-mux
        lsd: begin
            digit <= bcd_digit;
        end
        msd: begin
            digit <= ten? 1:0; // actual mux
        end
    endcase
    
end

// output decoding from state machine
assign anodes = ~state;

endmodule