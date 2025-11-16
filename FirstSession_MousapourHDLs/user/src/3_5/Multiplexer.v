`timescale 1ns/1ps

module Multiplexer(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire [3:0] btn = ~button;

assign LED[0] = btn[0] ? (btn[1] & btn[2]) : (~btn[1] & ~btn[2]);


endmodule