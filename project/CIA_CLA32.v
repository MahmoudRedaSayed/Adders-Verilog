`include "CLA4block.v"
`include "halfAdder.v"
module CIA32CLA (input [31:0]  a, input [31:0]  b, output [31:0] r,output coutres);

wire cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8;
wire [7:0]cout;
wire [31:0]res;
wire [8:0]carries;

genvar i;
generate
    for(i = 0;i<8;i = i+1)
    cla4bit CLA(a[3+(4*i):0+(4*i)],b[3+(4*i):0+(4*i)],res[3+(4*i):0+(4*i)],1'b0,cout[i]);
endgenerate

assign r[3:0] = res[3:0];
assign carries[0] = cout[0];
genvar j;
generate
    for(j = 0;j<7;j = j+1)
    incrementCircuit iA(res[7+(j*4):4+(j*4)],carries[j],cout[j+1],r[7+(j*4):4+(j*4)],carries[j+1]);
endgenerate

assign coutres = carries[7];

endmodule