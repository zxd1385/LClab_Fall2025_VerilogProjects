//~ `New testbench
`timescale  1ns / 1ns
`include "../../src/3_3/Function_Optimization.v"
`define PERIOD 10 

module tb_Function_Optimization;

// And_Xor Parameters
parameter PERIOD = 10;

// And_Xor Inputs
reg  [3:0] button = 0;

// And_Xor Outputs
wire  [4:0]    LED;

// And_Xor Bidirs





And_Xor  u_And_Xor (
    .button(button),

    .LED   (LED   )
);

initial begin
    $dumpfile("tb_Function_Optimization.vcd");  // ① Create a waveform file
    $dumpvars(0, tb_Function_Optimization);     // ② Dump all variables in this module
end


initial
begin
     // Initialize inputs
    button[0] = 0; button[1] = 0; button[2] = 0; button[3] = 0;
    $monitor("At time %t, button[0] = %b, button[1] = %b, button[2] = %b, button[3] = %b, LED[0] = %b, LED[1] = %b, LED[2] = %b, LED[3] = %b,", $time, button[0], button[1], button[2], button[3], LED[0], LED[1], LED[2], LED[3]);

    // Apply test vectors over time
    #(PERIOD);     button[0] = 0; button[1] = 0; button[2] = 0; button[3] = 1;  // First test vector
    #(PERIOD);     button[0] = 0; button[1] = 0; button[2] = 1; button[3] = 0;  // Second test vector
    #(PERIOD);     button[0] = 0; button[1] = 0; button[2] = 1; button[3] = 1;  // Third test vector
    #(PERIOD);     button[0] = 0; button[1] = 1; button[2] = 0; button[3] = 0;  // Fourth test vector
    #(PERIOD);     button[0] = 0; button[1] = 1; button[2] = 0; button[3] = 1;  // Fifth test vector
    #(PERIOD);

    $finish;
end

endmodule