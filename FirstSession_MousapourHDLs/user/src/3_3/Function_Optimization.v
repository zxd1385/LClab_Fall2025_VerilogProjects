`timescale 1ns/1ps

module And_Xor(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire [7:0] m;

assign m[0] = ~button[0] & ~button[1] & ~button[2] & ~button[3];
assign m[1] = ~button[0] & ~button[1] & button[2] & ~button[3];
assign m[2] = ~button[0] & button[1] & ~button[2] & ~button[3];
assign m[3] = ~button[0] & button[1] & ~button[2] & button[3];
assign m[4] = button[0] & ~button[1] & ~button[2] & ~button[3];
assign m[5] = button[0] & ~button[1] & button[2] & ~button[3];
assign m[6] = button[0] & button[1] & ~button[2] & ~button[3];
assign m[7] = button[0] & button[1] & ~button[2] & button[3];


assign LED[0] = m[0] |
                m[1] |
                m[2] |
                m[3] |
                m[4] |
                m[5] |
                m[6] |
                m[7] ;    
assign LED[1] = 1'b0;    
assign LED[2] = 1'b0;    
assign LED[3] = 1'b0;    
assign LED[4] = 1'b0;    

endmodule