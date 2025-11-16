`timescale 1ns/1ns

//==============================================================
module Q2A(

   input wire x1, x2, x3, x4,
   output wire Fo

);


   not(n1, x1);
   not(n2, x2);
   not(n3, x3);
   not(n4, x4);

   and(g1, n1, n2, n3, n4);
   and(g2, n1, n2, x3, n4);
   and(g3, n1, x2, x3, n4);
   and(g4, x1, n2, n3, n4);
   and(g5, x1, n2, x3, n4);
   and(g6, x1, x2, x3, n4);

   or(Fo, g1, g2, g3, g4, g5, g6);

endmodule
//==============================================================


`default_nettype none


//==============================================================
module Q2B(

    input wire x1, x2, x3, x4,
    output wire f

);

   wire g1, g2;

   assign g1 = (~x4 & ~x2);
   assign g2 = (~x4 & x3);

   assign f = g1 | g2;

endmodule
//==============================================================


//==============================================================
module Q2A__tb;

   wire x1, x2, x3, x4, Fo;
   integer i;

   assign {x1, x2, x3, x4} = i;

   initial begin
    $display("x1 x2 x3 x4 -> Fo");
    for (i=0; i<16; i=i+1) begin
        #3;
        $display("%b %b %b %b -> %b",
                  x1, x2, x3, x4, Fo);
        
    end
   end

   Q2A under_test(x1, x2, x3, x4, Fo);


endmodule
//==============================================================


//==============================================================
module Q2B__tb;

   wire x1, x2, x3, x4, f;
   integer i;

   assign {x1, x2, x3, x4} = i;

   initial begin
    $display("x1 x2 x3 x4 -> f");
    for (i=0; i<16; i=i+1) begin
        #3;
        $display("%b %b %b %b -> %b",
                  x1, x2, x3, x4, f);
        
    end
   end

   Q2B under_test(x1, x2, x3, x4, f);

endmodule
//==============================================================


//==============================================================
// You may develop a single test-bench
//==============================================================
module Q2__tb;

   wire x1, x2, x3, x4, f, Fo;
   integer i;

   assign {x1, x2, x3, x4} = i;

   initial begin
    $display("x1 x2 x3 x4 -> f   |   x1 x2 x3 x4 -> Fo");
    for (i=0; i<16; i=i+1) begin
        #3;
        $display("%b %b %b %b -> %b   |   %b %b %b %b -> %b ",
                  x1, x2, x3, x4, f,      x1, x2, x3, x4, Fo);
        
    end
   end

   Q2B Q2B_under_test(x1, x2, x3, x4, f);
   Q2A Q2A_under_test(x1, x2, x3, x4, Fo);

endmodule
//==============================================================