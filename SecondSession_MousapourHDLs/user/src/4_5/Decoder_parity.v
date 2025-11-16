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


// module show_Hex_on_7seg (
//     input wire [3:0]Dip,
//     output wire a,b,c,d,e,f,g,
//     output wire dp,
//     output wire  [3:0]Dig
// );

// assign Dig = 4'b1000;
// assign dp = 1'b1;

// Hex_to_7_seg instans1 ( Dip, a, b, c, d, e, f, g);


// endmodule


module Decoder_Parity(
    input wire [6:0]Dip,
    output reg [3:0]LED,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig
    );

wire [2:0]index;

assign index[0] = Dip[0] ^ Dip[2] ^ Dip[4] ^ Dip[6];
assign index[1] = Dip[1] ^ Dip[2] ^ Dip[5] ^ Dip[6];
assign index[2] = Dip[3] ^ Dip[4] ^ Dip[5] ^ Dip[6];

always @(*) begin
    LED = {Dip[2], Dip[4], Dip[5], Dip[6]};
    case(index) 
    3'b011 : LED[3] = ~LED[3] ;
    3'b101 : LED[2] = ~LED[2] ;
    3'b110 : LED[1] = ~LED[1] ;
    3'b111 : LED[0] = ~LED[0] ;
        
    endcase
end



show_Hex_on_7seg fi(
    {1'b0, index},
    a,b,c,d,e,f,g,
    dp,
    Dig
);

    
endmodule