module floatPointAdder(
    input [31:0] A,B, 
    output exception,
    output [31:0] result 
);


wire [24:0]resultOfAddingMantissa;

wire operation_sub_add;
wire output_sign;

wire [31:0] max,min;
wire [23:0] mantessaA,mantessaB;
wire [7:0] exponent_diff;


wire [23:0] shiftedMantessaMin;
wire [7:0] minExponent;

wire [7:0]incrementedMax;

wire [24:0] mantessaAdd;
wire [30:0] add_sum;

wire [23:0] mantessaSubComplement;
wire [24:0] mantessaSub,mantessaSubDash;
wire [30:0] sub_diff;
wire [24:0] subtraction_diff; 
wire [7:0] exponent_sub;

assign {max,min} = (A[30:0] < B[30:0]) ? {B,A} : {A,B};

assign exp_a = max[30:23];
assign exp_b = min[30:23];

assign exception = (&max[30:23]) | (&min[30:23]);

assign output_sign = max[31] ;

assign operation_sub_add = ~(max[31] ^ min[31]);

assign mantessaA = (|max[30:23]) ? {1'b1,max[22:0]} : {1'b0,max[22:0]};
assign mantessaB = (|min[30:23]) ? {1'b1,min[22:0]} : {1'b0,min[22:0]};

carrySelectAdder #(8)CS0(max[30:23],~min[30:23],1'b1,exponent_diff);

assign shiftedMantessaMin = mantessaB >> exponent_diff;

carrySelectAdder #(8)CS1(min[30:23],exponent_diff,1'b0,minExponent);


assign perform = (max[30:23] == minExponent);

carrySelectAdder #(24)CS2(mantessaA,shiftedMantessaMin,1'b0,resultOfAddingMantissa[23:0],resultOfAddingMantissa[24]);

assign mantessaAdd = (perform & operation_sub_add) ? resultOfAddingMantissa : 25'd0; 

assign add_sum[22:0] = mantessaAdd[24] ? mantessaAdd[23:1] : mantessaAdd[22:0];

carrySelectAdder #(8)CS3(max[30:23],8'b1,1'b0,incrementedMax);

assign add_sum[30:23] = mantessaAdd[24] ? incrementedMax : max[30:23];


assign mantessaSubComplement = (perform & !operation_sub_add) ? -shiftedMantessaMin : 24'd0 ; 

carrySelectAdder #(24)CS4(mantessaA,mantessaSubComplement,1'b0,mantessaSubDash[23:0],mantessaSubDash[24]);


assign mantessaSub = perform ? mantessaSubDash : 25'd0;

priority_encoder pe(mantessaSub,max[30:23],subtraction_diff,exponent_sub);

assign sub_diff[30:23] = exponent_sub;

assign sub_diff[22:0] = subtraction_diff[22:0];




assign result = exception ? 32'b0 : ((!operation_sub_add) ? {output_sign,sub_diff} : {output_sign,add_sum});

endmodule