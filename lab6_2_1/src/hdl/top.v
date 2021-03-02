`timescale 1ns / 1ps


module top(
    input enable,
    input clk,
    input clear,
    output [7:0] Q
);

wire [7:0] q; // outputs of FFs, left to right
wire t1, t2, t3, t4, t5, t6, t7, t8; // inputs to FFs, left to right

// flip flop 1: far left
toggleflop ff0(
    .clk (clk),
    .clr_n (clear),
    .t (enable),
    .q (q[0])
);

assign t1 = enable & q[0];

toggleflop ff1(
    .clk (clk),
    .clr_n (clear),
    .t (t1),
    .q (q[1])
);

assign t2 = t1 & q[1];

toggleflop ff2(
    .clk (clk),
    .clr_n (clear),
    .t (t2),
    .q (q[2])
);

assign t3 = t2 & q[2];

toggleflop ff3(
    .clk (clk),
    .clr_n (clear),
    .t (t3),
    .q (q[3])
);

assign t4 = t3 & q[3];

toggleflop ff4(
    .clk (clk),
    .clr_n (clear),
    .t (t4),
    .q (q[4])
);

assign t5 = t4 & q[4];

toggleflop ff5(
    .clk (clk),
    .clr_n (clear),
    .t (t5),
    .q (q[5])
);

assign t6 = t5 & q[5];

toggleflop ff6(
    .clk (clk),
    .clr_n (clear),
    .t (t6),
    .q (q[6])
);

assign t7 = t6 & q[6];

toggleflop ff7(
    .clk (clk),
    .clr_n (clear),
    .t (t7),
    .q (q[7])
);

assign Q = q[7:0];

endmodule