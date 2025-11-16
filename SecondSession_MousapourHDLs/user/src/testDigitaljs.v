module sevenseg(
    input  wire [3:0] val,    // value 0–15
    output wire [6:0] seg,    // a..g (active high)
    output wire dp
);

assign dp = 1'b1; // dot off

reg [6:0] seg_r;
assign seg = seg_r;

always @(*) begin
    case (val)
        4'h0: seg_r = 7'b1111110;
        4'h1: seg_r = 7'b0110000;
        4'h2: seg_r = 7'b1101101;
        4'h3: seg_r = 7'b1111001;
        4'h4: seg_r = 7'b0110011;
        4'h5: seg_r = 7'b1011011;
        4'h6: seg_r = 7'b1011111;
        4'h7: seg_r = 7'b1110000;
        4'h8: seg_r = 7'b1111111;
        4'h9: seg_r = 7'b1111011;
        4'hA: seg_r = 7'b1110111;
        4'hB: seg_r = 7'b0011111;
        4'hC: seg_r = 7'b1001110;
        4'hD: seg_r = 7'b0111101;
        4'hE: seg_r = 7'b1001111;
        4'hF: seg_r = 7'b1000111;
        default: seg_r = 7'b0000000;
    endcase
end

endmodule


module Decoder_Parity(
    input  wire [6:0] Dip,  // 7 digital switches
    output reg  [3:0] LED,  // 4 output LEDs
    output wire [6:0] seg,  // seven-seg segments
    output wire dp,
    output wire [3:0] Dig   // anode outputs for 7seg
);

assign Dig = 4'b1110; // Use digit0 only

//--------------------------------------------------
// Syndrome bits (index)
//--------------------------------------------------
wire [2:0] index;

assign index[0] = Dip[0] ^ Dip[2] ^ Dip[4] ^ Dip[6];  // p0
assign index[1] = Dip[1] ^ Dip[2] ^ Dip[5] ^ Dip[6];  // p1
assign index[2] = Dip[3] ^ Dip[4] ^ Dip[5] ^ Dip[6];  // p2

//--------------------------------------------------
// Correcting data bits d0,d1,d2,d3
//--------------------------------------------------

always @(*) begin
    // Extract data bits: d0,d1,d2,d3
    LED = {Dip[6], Dip[5], Dip[4], Dip[2]};  
    // LED = {d3, d2, d1, d0}

    // Flip appropriate bit depending on syndrome
    case(index)
        3'b011: LED[0] = ~LED[0]; // bit 3 = d0
        3'b101: LED[1] = ~LED[1]; // bit 5 = d1
        3'b110: LED[2] = ~LED[2]; // bit 6 = d2
        3'b111: LED[3] = ~LED[3]; // bit 7 = d3
    endcase
end

//--------------------------------------------------
// Show syndrome (index) on 7-seg
//--------------------------------------------------
sevenseg disp(
    .val({1'b0, index}), // show 0..7
    .seg(seg),
    .dp(dp)
);

endmodule
