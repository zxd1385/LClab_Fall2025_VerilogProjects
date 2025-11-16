module Transmission_Line(
    input wire [6:0]Data,
    input wire [6:0]Noise,
    output wire [6:0]NoisyData
);

assign NoisyData = Data ^ Noise;
    
endmodule