`timescale 1ns/1ps
`include "1bit_Half_Adder.v"

module Full_Adder(
    input wire A, B, Cin,
    output wire S, 
    output wire Cout
);

// wire [3:0] btn = ~button;

wire S1;
wire C1;
wire C2;


Half_Adder fH (.A(A), .B(B), .S(S1), .C(C1));
Half_Adder sH (.A(S1), .B(Cin), .S(S), .C(C2));

assign Cout = C1 | C2;

endmodule



// module Half_Adder(
//     input wire A,
//     input wire B,
//     output wire S,
//     output wire C
// );

// assign S = A ^ B;
// assign C = A & B;


// endmodule