
module CLAAndCByAAdderAndRippleAdderAdnPlusVersion_tb;
reg [31:0] A, B;
wire [31:0] CLAResult, CByAResult,rippleResult,PlusVResult, CarrySaveAdderResult, CarrySelectAdderResult,CIAResult,CSA32Result;
//wire [32:0] CarrySaveAdderResult;
wire CLACarryOut, CByACarryOut,rippleCarryout,PlusVCarryout, CarrySaveAdderCarry, CarrySelectAdderCarry,CIACarryOut,CSACarryOut;

wire CLAOverflow, CByAOverflow, CarrySaveAdderoverflow, CarrySelectAdderoverflow;

cla32bit claAdder(A, B, CLAResult, CLACarryOut, CLAOverflow);
cbya32bit cbyaAdder(A, B, CByAResult, CByACarryOut, CByAOverflow);
ripple_adder #(32) ripple (A,B,rippleResult,rippleCarryout);
PlusVersion #(32) PlusV (A,B,PlusVResult,PlusVCarryout);
carrySaveAdder #(32) CSA1(A, B, 32'b0, CarrySaveAdderResult, CarrySaveAdderCarry, CarrySaveAdderoverflow);
carrySelectAdder #(32) CSA2(A, B, 1'b0, CarrySelectAdderResult, CarrySelectAdderCarry, CarrySelectAdderoverflow);
CIA32CLA cia32adder(A, B, CIAResult, CIACarryOut);
CSkipA32 csa32adder(A, B, CSA32Result, CSACarryOut);

initial begin
	A = 32'b0;
        B = 32'b0; 
	#100;
	A = 32'h7fffffff; // overflow of 2 positive numbers
	B = 32'h1;
	#100;
	if (CLAResult === 32'h80000000 && CLAOverflow === 1'b1 && CByAResult === 32'h80000000 && CByAOverflow === 1'b1 && rippleResult === 32'h80000000 && rippleCarryout === 1'b0 && PlusVResult === 32'h80000000 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h80000000 && CarrySaveAdderoverflow === 1'b1 && CarrySelectAdderResult === 32'h80000000 && CarrySelectAdderoverflow === 1'b1 && CIAResult === 32'h80000000 && CIACarryOut === 1'b0 && CSA32Result === 32'h80000000 && CSACarryOut === 1'b0) begin  
		$display("TestCase#1: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'hffffffff; // overflow of 2 negative numbers
	B = 32'h80000000;
	#100;
	if (CLAResult === 32'h7fffffff && CLAOverflow === 1'b1 && CByAResult === 32'h7fffffff && CByAOverflow === 1'b1 && rippleResult === 32'h7fffffff && rippleCarryout === 1'b1 && PlusVResult === 32'h7fffffff && PlusVCarryout === 1'b1 && CarrySaveAdderResult === 32'h7fffffff && CarrySaveAdderoverflow === 1'b1 && CarrySelectAdderResult === 32'h7fffffff && CarrySelectAdderoverflow === 1'b1 && CIAResult === 32'h7fffffff && CIACarryOut === 1'b1 && CSA32Result === 32'h7fffffff && CSACarryOut === 1'b1 ) begin
		$display("TestCase#2: success");
	end else begin
		$display("TestCase#2: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'h2; // addition of 2 - 5 = -3 (hfffffffd)
	B = 32'hfffffffb;
	#100;
	if (CLAResult === 32'hfffffffd && CLAOverflow === 1'b0 && CByAResult === 32'hfffffffd && CByAOverflow === 1'b0&& rippleResult === 32'hfffffffd && rippleCarryout === 1'b0 && PlusVResult === 32'hfffffffd && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'hfffffffd && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'hfffffffd && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'hfffffffd && CIACarryOut === 1'b0 && CSA32Result === 32'hfffffffd && CSACarryOut === 1'b0 ) begin
		$display("TestCase#3: success");
	end else begin
		$display("TestCase#3: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'hc; // addition of 12 + 25 = 37 (h25)
	B = 32'h19;
	#100;
	if (CLAResult === 32'h25 && CLAOverflow === 1'b0 && CByAResult === 32'h25 && CByAOverflow === 1'b0&& rippleResult === 32'h25 && rippleCarryout === 1'b0 && PlusVResult === 32'h25 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h25 && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'h25 && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'h25 && CIACarryOut === 1'b0 && CSA32Result === 32'h25 && CSACarryOut === 1'b0) begin
		$display("TestCase#4: success");
	end else begin
		$display("TestCase#4: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'hfffffffb; // addition of -5 - 12 = -17 (hffffffef)
	B = 32'hfffffff4;
	#100;
	if (CLAResult === 32'hffffffef && CLAOverflow === 1'b0 && CByAResult === 32'hffffffef && CByAOverflow === 1'b0 && rippleResult === 32'hffffffef && rippleCarryout === 1'b1 && PlusVResult === 32'hffffffef && PlusVCarryout === 1'b1 && CarrySaveAdderResult === 32'hffffffef && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'hffffffef && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'hffffffef && CIACarryOut === 1'b1 && CSA32Result === 32'hffffffef && CSACarryOut === 1'b1) begin 
		$display("TestCase#5: success");
	end else begin
		$display("TestCase#5: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'h2;
	B = 32'h1;
	#100;
	if (CLAResult === 32'h3 && CLAOverflow === 1'b0 && CByAResult === 32'h3 && CByAOverflow === 1'b0 && rippleResult === 32'h3 && rippleCarryout === 1'b0 && PlusVResult === 32'h3 && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'h3 && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'h3 && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'h3 && CIACarryOut === 1'b0 && CSA32Result === 32'h3 && CSACarryOut === 1'b0) begin
		$display("TestCase#6: success");
	end else begin
		$display("TestCase#6: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'h7;
	B = 32'h8;
	#100;
	if (CLAResult === 32'hf && CLAOverflow === 1'b0 && CByAResult === 32'hf && CByAOverflow === 1'b0 && rippleResult === 32'hf && rippleCarryout === 1'b0 && PlusVResult === 32'hf && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'hf && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'hf && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'hf && CIACarryOut === 1'b0 && CSA32Result === 32'hf && CSACarryOut === 1'b0) begin
		$display("TestCase#7: success");
	end else begin
		$display("TestCase#7: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
	A = 32'h0;
	B = 32'ha;
	#100;
	if (CLAResult === 32'ha && CLAOverflow === 1'b0 && CByAResult === 32'ha && CByAOverflow === 1'b0 && rippleResult === 32'ha && rippleCarryout === 1'b0 && PlusVResult === 32'ha && PlusVCarryout === 1'b0 && CarrySaveAdderResult === 32'ha && CarrySaveAdderoverflow === 1'b0 && CarrySelectAdderResult === 32'ha && CarrySelectAdderoverflow === 1'b0 && CIAResult === 32'ha && CIACarryOut === 1'b0 && CSA32Result === 32'ha && CSACarryOut === 1'b0) begin
		$display("TestCase#8: success");
	end else begin
		$display("TestCase#8: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow);
	end
end
endmodule