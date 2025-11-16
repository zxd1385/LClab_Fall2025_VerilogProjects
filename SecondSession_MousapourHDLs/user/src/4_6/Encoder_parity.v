module Encoder_Parity(
    input wire [3:0]Dip,
    output wire [6:0]LED
);

wire p0, p1, p2;

assign p0 = Dip[0] ^ Dip[1] ^ Dip[3];
assign p1 = Dip[0] ^ Dip[2] ^ Dip[3];
assign p2 = Dip[1] ^ Dip[2] ^ Dip[3];

assign LED = {p0, p1, Dip[0], p2, Dip[1], Dip[2], Dip[3]};
    
endmodule