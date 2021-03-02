`timescale 1ns / 1ps

module toggleflop(
    input clk,
    input clr_n,
    input t,
    output q
);

assign d = q ^ t;

// d flipflop with async clear instantiation
flipflop ff(
    .clr_n (clr_n),
    .clk (clk),
    .d (d),
    .q (q)
);

endmodule