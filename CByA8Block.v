
module cbya8bit (input [7:0]  a, input [7:0]  b, output [7:0] r, input cin, output cout);
  wire [7:0] p;
  wire [8:0] c;
  wire BP;
  assign c[0] = cin;
  // Pi=Ai^Bi (Propagate)
  assign p = a ^ b; // bitwise xor all bits of A and B
  assign BP = &p; // bitwise and all bits of P
  assign cout = (BP == 1) ? cin : c[8]; // if ByPass, pass the input carry directly to the output carry
  genvar i;
  generate
  	for(i = 7; i >= 0; i = i - 1)
 		FullAdder fa(a[i], b[i], c[i], r[i], c[i+1]);
  endgenerate
endmodule