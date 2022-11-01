`include "carry_select_adder_4bit.v"
module carrySelectAdder #(parameter N=32)(input [N-1:0] x, input [N-1:0] y, input carryin, output [N-1:0] sum, output carryout, output overflow);

wire [(N/4):0] c;

assign c[0] = carryin;

genvar i;
generate
for(i = 0; i < (N/4); i = i + 1)
carrySelectAdder4bit SA(x[((i*4)+3):(i*4)], y[((i*4)+3):(i*4)], c[i], sum[((i*4)+3):(i*4)], c[i+1]);
endgenerate

assign carryout = c[(N/4)];

assign overflow = (x[N-1] ^ sum[N-1]) & (y[N-1] ^ sum[N-1]);

endmodule
