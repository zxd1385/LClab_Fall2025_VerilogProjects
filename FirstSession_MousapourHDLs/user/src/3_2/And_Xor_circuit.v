`timescale 1ns/1ps

module And_Xor(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire g;
wire f;

assign g = ~button[2] & ~button[3];
assign f = ~button[0] & ~button[1];

assign LED[0] = g;
assign LED[1] = f ^ g;

endmodule