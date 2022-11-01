
module cbya32bit (input [31:0]  a, input [31:0]  b, output [31:0] r, output cout, output overflow);
  wire [4:0] c;
  assign c[0] = 1'b0;
  assign cout = c[4];
  assign overflow = (a[31] ^ r[31]) & (b[31] ^ r[31]);
  genvar i;
  generate
  	for(i = 3; i >= 0; i = i - 1)
 		cbya8bit block(.a(a[(i*8+7):i*8]), .b(b[(i*8+7):i*8]), .r(r[(i*8+7):i*8]), .cin(c[i]), .cout(c[i+1]));
  endgenerate
endmodule

