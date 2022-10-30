module cla4bit (input [3:0]  a, input [3:0]  b, output [3:0] r, input cin, output cout);
  wire [3:0] c, g, p;
  // Gi=Ai.Bi
  assign g = a & b;
  // Pi=Ai^Bi
  assign p = a ^ b;
  // Ci=Gi+Pi.Ci-1
  assign c[0] = cin; 
  assign c[1] = g[0] | (p[0] & c[0]);
  assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
  assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] &  g[0]) | ( p[2] & p[1] & p[0] & c[0]);
  // Final carry (C4)
  assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1])  | (p[3] & p[2] & p[1] &  g[0]) | ( p[3] & p[2] & p[1] & p[0] & c[0]);
  // Result
  assign r = p ^ c;
endmodule
