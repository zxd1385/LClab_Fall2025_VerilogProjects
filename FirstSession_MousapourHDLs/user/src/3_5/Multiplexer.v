`timescale 1ns/1ps

module Multiplexer(
    input wire [3:0] button,
    output wire [4:0] LED
);

assign LED[0] = button[0] ? (button[1] & button[2]) : (~button[1] & ~button[2]);


endmodule