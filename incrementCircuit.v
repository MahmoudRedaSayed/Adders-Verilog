module incrementCircuit(input [3:0]res,input cin,input cout,output [3:0]r,output carry);

wire [4:0]carries;
// halfAdder HA1(res[4],cout[0],r[4],carries[0]);
// halfAdder HA2(res[5],carries[0],r[5],carries[1]);
// halfAdder HA3(res[6],carries[1],r[6],carries[2]);
// halfAdder HA4(res[7],carries[2],r[7],carries[3]);
assign carries[0] = cin;
genvar i;
generate
    for(i = 0;i<4;i = i+1)
    halfAdder HA1(res[i],carries[i],r[i],carries[i+1]);
endgenerate
assign carry = cout || carries[4];
endmodule