// module Hex_to_7_seg
// (
// input wire [3:0] Hex ,
// output reg a,b,c,d,e,f,g
// );
// always @(Hex) begin
// case(Hex)
// 0 : {a,b,c,d,e,f,g} = ~ 7'b1111110 ;
// 1 : {a,b,c,d,e,f,g} = ~ 7'b0110000 ;
// 2 : {a,b,c,d,e,f,g} = ~7'b1101101 ;
// 3 : {a,b,c,d,e,f,g} = ~7'b1111001 ;
// 4 : {a,b,c,d,e,f,g} = ~7'b0110011 ;
// 5 : {a,b,c,d,e,f,g} = ~7'b1011011 ;
// 6 : {a,b,c,d,e,f,g} = ~7'b1011111 ;
// 7 : {a,b,c,d,e,f,g} = ~7'b1110000 ;
// 8 : {a,b,c,d,e,f,g} = ~7'b1111111 ;
// 9 : {a,b,c,d,e,f,g} = ~7'b1111011 ;
// 10 : {a,b,c,d,e,f,g} = ~7'b1110111 ; // A
// 11 : {a,b,c,d,e,f,g} = ~7'b0011111 ; // b
// 12 : {a,b,c,d,e,f,g} = ~7'b1001110 ; // C
// 13 : {a,b,c,d,e,f,g} = ~7'b0111101 ; // d
// 14 : {a,b,c,d,e,f,g} = ~7'b1001111 ; // E
// 15 : {a,b,c,d,e,f,g} = ~7'b1000111 ; // F
// endcase
// end
// endmodule


module show_Hex_on_7seg (
    input wire [3:0]Dip,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig
);

assign Dig = 4'b1000;
assign dp = 1'b1;

Hex_to_7_seg instans1 ( Dip, a, b, c, d, e, f, g);


endmodule