module CSkipA32(input [31:0]  a, input [31:0]  b, output [31:0] sum,output cout,output overflow);
  
  wire [7:0] couts;
  wire [6:0] e;
  assign overflow = (a[31] ^ sum[31]) & (b[31] ^ sum[31]);
  
  cla4bit cla0(a[3:0], b[3:0],sum[3:0],  1'b0, couts[0]);
  cla4bit cla[7:1](a[31:4], b[31:4],sum[31:4],e[6:0], couts[7:1]);
  
  SkipLogic skip0(e[0], a[3:0], b[3:0], 1'b0, couts[0]);
  SkipLogic skip[6:1](e[6:1], a[27:4], b[27:4], e[5:0], couts[6:1]);
  SkipLogic skip7(cout, a[31:28], b[31:28], e[6], couts[7]);

endmodule