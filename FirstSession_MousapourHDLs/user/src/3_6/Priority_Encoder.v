`timescale 1ns/1ps

module Priority_Encoder(
    input wire [3:0] button,
    output wire [4:0] LED
);

assign LED[2] = button[3] ? 1'b1 : 1'b0;
assign LED[1] = button[3] ? 1'b0 : button[2] ? 1'b1 : button[1] ? 1'b1 : button[0] ? 1'b0 : 1'b0;
assign LED[0] = button[3] ? 1'b0 : button[2] ? 1'b1 : button[1] ? 1'b0 : button[0] ? 1'b1 : 1'b0;



endmodule