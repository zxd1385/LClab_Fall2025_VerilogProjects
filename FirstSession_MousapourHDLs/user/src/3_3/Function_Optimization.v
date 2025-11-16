`timescale 1ns/1ps

module Function_Optimization(
    input wire [3:0] button,
    output wire [4:0] LED
);

wire [7:0] m;

wire [3:0] btn = ~button;

assign m[0] = ~btn[0] & ~btn[1] & ~btn[2] & ~btn[3];
assign m[1] = ~btn[0] & ~btn[1] & btn[2] & ~btn[3];
assign m[2] = ~btn[0] & btn[1] & ~btn[2] & ~btn[3];
assign m[3] = ~btn[0] & btn[1] & ~btn[2] & btn[3];
assign m[4] = btn[0] & ~btn[1] & ~btn[2] & ~btn[3];
assign m[5] = btn[0] & ~btn[1] & btn[2] & ~btn[3];
assign m[6] = btn[0] & btn[1] & ~btn[2] & ~btn[3];
assign m[7] = btn[0] & btn[1] & ~btn[2] & btn[3];


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