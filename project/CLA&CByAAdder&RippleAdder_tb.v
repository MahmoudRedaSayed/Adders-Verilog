
module CLAAndCByAAdderAndRippleAdderAdnPlusVersion_tb;
reg [31:0] A, B;
wire [31:0] CLAResult, CByAResult,rippleResult,PlusVResult, CarrySaveAdderResult, CarrySelectAdderResult;
//wire [32:0] CarrySaveAdderResult;
wire CLACarryOut, CByACarryOut,rippleCarryout,PlusVCarryout, CarrySaveAdderCarry, CarrySelectAdderCarry;

wire CarrySaveAdderoverflow, CarrySelectAdderoverflow;

cla32bit claAdder(A, B, CLAResult, CLACarryOut);
cbya32bit cbyaAdder(A, B, CByAResult, CByACarryOut);
ripple_adder #(32) ripple (A,B,rippleResult,rippleCarryout);
PlusVersion #(32) PlusV (A,B,PlusVResult,PlusVCarryout);
carrySaveAdder #(32) CSA1(A, B, 32'b0, CarrySaveAdderResult, CarrySaveAdderCarry, CarrySaveAdderoverflow);
carrySelectAdder #(32) CSA2(A, B, 1'b0, CarrySelectAdderResult, CarrySelectAdderCarry, CarrySelectAdderoverflow);

initial begin
	A = 32'b0;
        B = 32'b0; 
	#100;
	A = 32'h7fffffff; // overflow of 2 positive numbers
	B = 32'h1;
	#100;
	if (CLAResult === 32'h80000000 && CLACarryOut === 1'b0 && CByAResult === 32'h80000000 && CByACarryOut === 1'b0 && rippleResult === 32'h80000000 && rippleCarryout === 1'b0 && PlusVResult === 32'h80000000 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h80000000 && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'h80000000 && CarrySelectAdderCarry === 1'b0) begin                                                               
		$display("TestCase#1: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'hffffffff; // overflow of 2 negative numbers
	B = 32'h80000000;
	#100;
	if (CLAResult === 32'h7fffffff && CLACarryOut === 1'b1 && CByAResult === 32'h7fffffff && CByACarryOut === 1'b1 && rippleResult === 32'h7fffffff && rippleCarryout === 1'b1 && PlusVResult === 32'h7fffffff && PlusVCarryout === 1'b1 && CarrySaveAdderResult === 32'h7fffffff && CarrySaveAdderCarry === 1'b1 && CarrySelectAdderResult === 32'h7fffffff && CarrySelectAdderCarry === 1'b1) begin
		$display("TestCase#2: success");
	end else begin
		$display("TestCase#2: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'h2; // addition of 2 - 5 = -3 (hfffffffd)
	B = 32'hfffffffb;
	#100;
	if (CLAResult === 32'hfffffffd && CLACarryOut === 1'b0 && CByAResult === 32'hfffffffd && CByACarryOut === 1'b0&& rippleResult === 32'hfffffffd && rippleCarryout === 1'b0 && PlusVResult === 32'hfffffffd && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'hfffffffd && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'hfffffffd && CarrySelectAdderCarry === 1'b0) begin
		$display("TestCase#3: success");
	end else begin
		$display("TestCase#3: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'hc; // addition of 12 + 25 = 37 (h25)
	B = 32'h19;
	#100;
	if (CLAResult === 32'h25 && CLACarryOut === 1'b0 && CByAResult === 32'h25 && CByACarryOut === 1'b0&& rippleResult === 32'h25 && rippleCarryout === 1'b0 && PlusVResult === 32'h25 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h25 && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'h25 && CarrySelectAdderCarry === 1'b0) begin
		$display("TestCase#4: success");
	end else begin
		$display("TestCase#4: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'hfffffffb; // addition of -5 - 12 = -17 (hffffffef)
	B = 32'hfffffff4;
	#100;
	if (CLAResult === 32'hffffffef && CLACarryOut === 1'b1 && CByAResult === 32'hffffffef && CByACarryOut === 1'b1 && rippleResult === 32'hffffffef && rippleCarryout === 1'b1 && PlusVResult === 32'hffffffef && PlusVCarryout === 1'b1 && CarrySaveAdderResult === 32'hffffffef && CarrySaveAdderCarry === 1'b1 && CarrySelectAdderResult === 32'hffffffef && CarrySelectAdderCarry === 1'b1) begin 
		$display("TestCase#5: success");
	end else begin
		$display("TestCase#5: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'h2;
	B = 32'h1;
	#100;
	if (CLAResult === 32'h3 && CLACarryOut === 1'b0 && CByAResult === 32'h3 && CByACarryOut === 1'b0 && rippleResult === 32'h3 && rippleCarryout === 1'b0 && PlusVResult === 32'h3 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h3 && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'h3 && CarrySelectAdderCarry === 1'b0) begin
		$display("TestCase#6: success");
	end else begin
		$display("TestCase#6: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'h7;
	B = 32'h8;
	#100;
	if (CLAResult === 32'hf && CLACarryOut === 1'b0 && CByAResult === 32'hf && CByACarryOut === 1'b0 && rippleResult === 32'hf && rippleCarryout === 1'b0 && PlusVResult === 32'hf && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'hf && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'hf && CarrySelectAdderCarry === 1'b0) begin
		$display("TestCase#7: success");
	end else begin
		$display("TestCase#7: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
	A = 32'h0;
	B = 32'ha;
	#100;
	if (CLAResult === 32'ha && CLACarryOut === 1'b0 && CByAResult === 32'ha && CByACarryOut === 1'b0 && rippleResult === 32'ha && rippleCarryout === 1'b0 && PlusVResult === 32'ha && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'ha && CarrySaveAdderCarry === 1'b0 && CarrySelectAdderResult === 32'ha && CarrySelectAdderCarry === 1'b0) begin
		$display("TestCase#8: success");
	end else begin
		$display("TestCase#8: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderCarry, CarrySelectAdderCarry);
	end
end
endmodule