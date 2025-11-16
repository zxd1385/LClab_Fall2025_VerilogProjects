`timescale 1ns/1ps

module Towbit_Producter(
    input wire [3:0] button,
    output wire [4:0] LED
);

// this module will product 2 2-bit numbers and shows them on zynqe board. like
// 10 * 11 = 0110

wire [3:0] btn = ~button;

assign LED[0] = (btn[0] & btn[1] & btn[2] & btn[3]);
assign LED[1] = (btn[0] & btn[1] & btn[2] & ~btn[3]) | (btn[0] & ~btn[1] & btn[2] & btn[3]) | (btn[0] & ~btn[1] & btn[2] & ~btn[3]);
assign LED[2] = (btn[0] & btn[1] & btn[2] & ~btn[3]) | (btn[0] & btn[1] & ~btn[2] & btn[3]) | (btn[0] & ~btn[1] & btn[2] & btn[3]) | (btn[0] & ~btn[1] & ~btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & ~btn[3]);
assign LED[3] = (btn[0] & btn[1] & btn[2] & btn[3]) | (btn[0] & btn[1] & ~btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & btn[3]) | (~btn[0] & btn[1] & ~btn[2] & btn[3]) ;



endmodule