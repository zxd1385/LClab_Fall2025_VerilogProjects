
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

assign Dig = 4'b1000;
assign dp = 1'b1;

Hex_to_7_seg instans1 ( Dip, a, b, c, d, e, f, g);


endmodule




module Encoder_Parity(
    input wire [3:0]Dip,
    output wire [7:0]LED
);

wire p0, p1, p2, pt;

assign p0 = Dip[0] ^ Dip[1] ^ Dip[3];
assign p1 = Dip[0] ^ Dip[2] ^ Dip[3];
assign p2 = Dip[1] ^ Dip[2] ^ Dip[3];
assign pt = Dip[1] ^ Dip[2] ^ Dip[3] ^ Dip[0] ^ p0 ^ p1 ^ p2;

assign LED = {pt, p0, p1, Dip[0], p2, Dip[1], Dip[2], Dip[3]};
    
endmodule


module Transmission_Line(
    input wire [7:0]Data,
    input wire [7:0]Noise,
    output wire [7:0]NoisyData
);

assign NoisyData = Data ^ Noise;
    
endmodule





module Decoder_Parity(
    input wire [7:0]Dip,
    output reg [3:0]LED,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig
    );

wire [2:0]index;
wire allcellsP;

assign index[0] = Dip[6] ^ Dip[4] ^ Dip[2] ^ Dip[0];
assign index[1] = Dip[5] ^ Dip[4] ^ Dip[1] ^ Dip[0];
assign index[2] = Dip[3] ^ Dip[2] ^ Dip[1] ^ Dip[0];
assign allcellsP = Dip[3] ^ Dip[2] ^ Dip[1] ^ Dip[0] ^ Dip[6] ^ Dip[5] ^ Dip[4] ^ Dip[7];

reg [3:0]tempindex;
always @(*) begin
    LED = {Dip[4], Dip[2], Dip[1], Dip[0]};
    case(index) 
    3'b011 : LED[3] = ~LED[3] ;
    3'b101 : LED[2] = ~LED[2] ;
    3'b110 : LED[1] = ~LED[1] ;
    3'b111 : LED[0] = ~LED[0] ;
        
    endcase

    tempindex = {1'b0, index};
    if (allcellsP == 1'b0 & index != 3'b000) begin
        LED = 4'b1111;
        tempindex = 4'b1110;
    end 
end



show_Hex_on_7seg fi(
    tempindex,
    a,b,c,d,e,f,g,
    dp,
    Dig
);

    
endmodule


module Noisy_Channel(
    input wire [3:0]Dip,
    input wire [7:0]Noise,
    output wire [3:0]LED,
    output wire a,b,c,d,e,f,g,
    output wire dp,
    output wire  [3:0]Dig

);

wire [7:0]Encoded;
wire [7:0]Noised;
Encoder_Parity fE(Dip, Encoded);
Transmission_Line fT(Encoded, Noise, Noised);
Decoder_Parity fD(
    Noised,
    LED,
    a,b,c,d,e,f,g,
    dp,
    Dig
);

    
endmodule