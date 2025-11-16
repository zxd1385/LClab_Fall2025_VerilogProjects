`timescale 1ns/1ps

module Half_Adder(
    input wire A,
    input wire B,
    output wire S,
    output wire C
);

assign S = A ^ B;
assign C = A & B;


endmodule

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

module Hex_to_7_seg
(
input wire [3:0] Hex ,
output reg a,b,c,d,e,f,g
);
always @(Hex) begin
case(Hex)
0 : {a,b,c,d,e,f,g} = ~ 7'b1111110 ;
1 : {a,b,c,d,e,f,g} = ~ 7'b0110000 ;
2 : {a,b,c,d,e,f,g} = ~7'b1101101 ;
3 : {a,b,c,d,e,f,g} = ~7'b1111001 ;
4 : {a,b,c,d,e,f,g} = ~7'b0110011 ;
5 : {a,b,c,d,e,f,g} = ~7'b1011011 ;
6 : {a,b,c,d,e,f,g} = ~7'b1011111 ;
7 : {a,b,c,d,e,f,g} = ~7'b1110000 ;
8 : {a,b,c,d,e,f,g} = ~7'b1111111 ;
9 : {a,b,c,d,e,f,g} = ~7'b1111011 ;
10 : {a,b,c,d,e,f,g} = ~7'b1110111 ; // A
11 : {a,b,c,d,e,f,g} = ~7'b0011111 ; // b
12 : {a,b,c,d,e,f,g} = ~7'b1001110 ; // C
13 : {a,b,c,d,e,f,g} = ~7'b0111101 ; // d
14 : {a,b,c,d,e,f,g} = ~7'b1001111 ; // E
15 : {a,b,c,d,e,f,g} = ~7'b1000111 ; // F
endcase
end
endmodule

module show_Hex_on_7seg (
    input wire [3:0]Dip,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig
);

assign Dig = 4'b0001;
assign dp = 1'b1;

Hex_to_7_seg instans1 ( Dip, a, b, c, d, e, f, g);


endmodule


module unsigned_3bit_adder(
    input wire [6:0]Dip,
    output wire [2:0]D
);


wire Cout;
wire [2:0]S;
wire tempC1;
wire tempC2;

Full_Adder ff(.A(Dip[5]), .B(Dip[2]), .Cin(Dip[6]), .S(S[0]), .Cout(tempC1));
Full_Adder sf(.A(Dip[4]), .B(Dip[1]), .Cin(tempC1), .S(S[1]), .Cout(tempC2));
Full_Adder thf(.A(Dip[3]), .B(Dip[0]), .Cin(tempC2), .S(S[2]), .Cout(Cout));

assign D = S;


    
endmodule




//wrapper module...


module signed_3bit_adder_and_subtractor(
    input wire [7:0]Dip,
    input wire op,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig,
    output wire sgn,
    output wire overflow
);


wire [3:0]XOR_pattern = {op, op, op, op};
wire [3:0]second_number = {Dip[7], Dip[6], Dip[5], Dip[4]};
wire [3:0]XORed_second_number = XOR_pattern ^ second_number;

wire Cout;
wire [3:0]S;
wire tempC1;
wire tempC2;
wire tempC3;

Full_Adder ff1(.A(Dip[3]), .B(XORed_second_number[3]), .Cin(op), .S(S[0]), .Cout(tempC1));
Full_Adder sf(.A(Dip[2]), .B(XORed_second_number[2]), .Cin(tempC1), .S(S[1]), .Cout(tempC2));
Full_Adder thf(.A(Dip[1]), .B(XORed_second_number[1]), .Cin(tempC2), .S(S[2]), .Cout(tempC3));
Full_Adder fourthf(.A(Dip[0]), .B(XORed_second_number[0]), .Cin(tempC3), .S(S[3]), .Cout(Cout));




assign overflow = ( (Dip[0] == XORed_second_number[0] ) & (S[3] != Dip[0]) ) ? 1'b1 : 1'b0;

// 2's complementing S
wire [2:0]D;
unsigned_3bit_adder threef({1'b0, 1'b1, 1'b0, 1'b0, ~S[0], ~S[1], ~S[2]}, D);

wire [2:0]finalShow;
assign finalShow = S[3] ? D : S;

wire aa, bb, cc, dd, ee, ff, gg;
show_Hex_on_7seg out(
                {1'b0, finalShow[2], finalShow[1], finalShow[0]},
                aa, bb, cc, dd, ee, ff, gg,
                dp,
                Dig
                );

assign {a,b,c,d,e,f,g} = overflow ? ~7'b0000000 : {aa, bb, cc, dd, ee, ff, gg};
assign sgn = overflow ? 1'b0 : S[3];




    
endmodule