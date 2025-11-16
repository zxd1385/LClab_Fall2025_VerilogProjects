`timescale 1ns/1ps

module Priority_Encoder(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire [3:0] btn = ~button;

assign LED[2] = btn[3] ? 1'b1 : 1'b0;
assign LED[1] = btn[3] ? 1'b0 : btn[2] ? 1'b1 : btn[1] ? 1'b1 : btn[0] ? 1'b0 : 1'b0;
assign LED[0] = btn[3] ? 1'b0 : btn[2] ? 1'b1 : btn[1] ? 1'b0 : btn[0] ? 1'b1 : 1'b0;



endmodule