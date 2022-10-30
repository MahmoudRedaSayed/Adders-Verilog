module cla32bit (input [31:0]  a, input [31:0]  b, output [31:0] r, output cout);
  wire [8:0] c;
  assign c[0] = 1'b0;
  assign cout = c[8];
  genvar i;
  generate
  	for(i = 7; i >= 0; i = i - 1)
 		cla4bit block(.a(a[(i*4+3):i*4]), .b(b[(i*4+3):i*4]), .r(r[(i*4+3):i*4]), .cin(c[i]), .cout(c[i+1]));
  endgenerate
endmodule


