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
    input wire [3:0] button,
    output wire [1:0] LED
);

wire [3:0] btn = button;

wire S1;
wire C1;
wire C2;


Half_Adder fH (.A(btn[1]), .B(btn[2]), .S(S1), .C(C1));
Half_Adder sH (.A(btn[0]), .B(S1), .S(LED[0]), .C(C2));

assign LED[1] = C1 | C2;

endmodule





module Towbit_Adder(
    input wire [3:0] button,
    output wire [4:0] LED
);

// this module will product 2 2-bit numbers and shows them on zynqe board. like
// 10 * 11 = 0110

// wire [3:0] btn = ~button;
wire carry;
Full_Adder f1 (
    .button({1'b1, button[3], button[1], 1'b0}),
    .LED({carry , LED[0]})
    );
Full_Adder f2 (
    .button({1'b1, button[0], button[2], carry}),
    .LED({LED[2] , LED[1]})
    );


endmodule






module Towbit_Producter(
    input wire [3:0] button,
    output wire [4:0] LED
);

// this module will product 2 2-bit numbers and shows them on zynqe board. like
// 10 * 11 = 0110

wire [3:0] btn = ~button;

assign LED[0] = (btn[0] & btn[1] & btn[2] & btn[3]);
assign LED[1] = (btn[0] & btn[1] & btn[2] & ~btn[3]) | (btn[0] & ~btn[1] & btn[2] & btn[3]) | (btn[0] & ~btn[1] & btn[2] & ~btn[3]);
assign LED[2] = (btn[0] & btn[1] & btn[2] & ~btn[3]) | (btn[0] & btn[1] & ~btn[2] & btn[3]) | (btn[0] & ~btn[1] & btn[2] & btn[3]) | (btn[0] & ~btn[1] & ~btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & ~btn[3]);
assign LED[3] = (btn[0] & btn[1] & btn[2] & btn[3]) | (btn[0] & btn[1] & ~btn[2] & btn[3]) | (~btn[0] & btn[1] & btn[2] & btn[3]) | (~btn[0] & btn[1] & ~btn[2] & btn[3]) ;



endmodule

module out(
    input wire [5:0] button,
    output wire [4:0] LED
);

reg f;

always @(*) begin
    if (button[4] == 0 & button[5] == 0) begin
        Towbit_Adder tw(.button({button[0], button[1], button[2], button[3], .LED(LED)}));
    end
    else if(button[4] == 0 & button[5] == 1) begin
        Towbit_Producter tp(.button({button[0], button[1], button[2], button[3], .LED(LED)}))
    end
    else if(button[4] == 1 & button[5] == 0) begin
        Towbit_Adder tw(.button({button[0], button[1], ~button[2], ~button[3], .LED(LED)}));
    end
    
end

endmodule
