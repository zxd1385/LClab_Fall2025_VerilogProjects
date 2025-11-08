`timescale 1ns/1ps
// `include "1bit_Half_Adder.v"

module Full_Adder(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire S1;
wire C1;
wire C2;


Half_Adder fH (.A(button[1]), .B(button[2]), .S(S1), .C(C1));
Half_Adder sH (.A(button[0]), .B(S1), .S(LED[0]), .C(C2));

assign LED[1] = C1 | C2;

endmodule



module Half_Adder(
    input wire A,
    input wire B,
    output wire S,
    output wire C
);

assign S = A ^ B;
assign C = A & B;


endmodule