module CLAAndCByAAdderAndRippleAdderAdnPlusVersion_tb;
reg [31:0] A, B;
wire [31:0] CLAResult, CByAResult,rippleResult,PlusVResult, CarrySaveAdderResult, CarrySelectAdderResult,CIAResult,CSA32Result;
//wire [32:0] CarrySaveAdderResult;
wire CLACarryOut, CByACarryOut,rippleCarryout,PlusVCarryout, CarrySaveAdderCarry, CarrySelectAdderCarry,CIACarryOut,CSACarryOut;

wire CLAOverflow, CByAOverflow, CarrySaveAdderoverflow, CarrySelectAdderoverflow , RippleOverFlow , PlusOverFlow,CSA32OverFlow,CIA32OverFlow ;

cla32bit claAdder(A, B, CLAResult, CLACarryOut, CLAOverflow);
cbya32bit cbyaAdder(A, B, CByAResult, CByACarryOut, CByAOverflow);
ripple_adder #(32) ripple (A,B,rippleResult,rippleCarryout,RippleOverFlow);
PlusVersion #(32) PlusV (A,B,PlusVResult,PlusVCarryout,PlusOverFlow);
carrySaveAdder #(32) CSA1(A, B, 32'b0, CarrySaveAdderResult, CarrySaveAdderCarry, CarrySaveAdderoverflow);
carrySelectAdder #(32) CSA2(A, B, 1'b0, CarrySelectAdderResult, CarrySelectAdderCarry, CarrySelectAdderoverflow);
CIA32CLA cia32adder(A, B, CIAResult, CIACarryOut,CIA32OverFlow);
CSkipA32 csa32adder(A, B, CSA32Result, CSACarryOut,CSA32OverFlow);

wire condition;

assign condition = (CLAResult ==PlusVResult)&&
( CSA32Result  ==PlusVResult)&&
(CarrySelectAdderResult==PlusVResult)&&
(CIAResult ==PlusVResult)&&
(CByAResult==PlusVResult)&&
(rippleResult ==PlusVResult)&&
(PlusVResult == CarrySaveAdderResult)
&&(CLAOverflow  ==PlusOverFlow)&&
(CByAOverflow == PlusOverFlow)&&
(RippleOverFlow==PlusOverFlow)&&
(PlusOverFlow ==CarrySaveAdderoverflow)&&
(PlusOverFlow ==  CarrySelectAdderoverflow)&&
(PlusOverFlow ==CSA32OverFlow)&&
(PlusOverFlow==CIA32OverFlow)
&&( rippleCarryout   ==  PlusVCarryout )&&
(PlusVCarryout == CIACarryOut)&&
(PlusVCarryout == CSACarryOut)&&
(PlusVCarryout ==CarrySelectAdderCarry)&&
(PlusVCarryout==CarrySaveAdderCarry)&&
(PlusVCarryout ==CLACarryOut)&&
(PlusVCarryout ==CByACarryOut);

initial begin
	A = 32'b0;
        B = 32'b0; 
	#100;
	A = 32'h7fffffff; // overflow of 2 positive numbers
	B = 32'h1;
	#100;
	if (condition) begin  
		$display("TestCase#1: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);
	end
	A = 32'hffffffff; // overflow of 2 negative numbers
	B = 32'h80000000;
	#100;
	if (condition) begin
		$display("TestCase#2: success");
	end else begin
		$display("TestCase#2: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
	A = 32'h2; // addition of 2 - 5 = -3 (hfffffffd)
	B = 32'hfffffffb;
	#100;
	if (condition ) begin
		$display("TestCase#3: success");
	end else begin
		$display("TestCase#3: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);
	end
	A = 32'hc; // addition of 12 + 25 = 37 (h25)
	B = 32'h19;
	#100;
	if (condition) begin
		$display("TestCase#4: success");
	end else begin
		$display("TestCase#4: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
	A = 32'hfffffffb; // addition of -5 - 12 = -17 (hffffffef)
	B = 32'hfffffff4;
	#100;
	if (condition) begin 
		$display("TestCase#5: success");
	end else begin
		$display("TestCase#5: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
	A = 32'h2;
	B = 32'h1;
	#100;
	if (condition) begin
		$display("TestCase#6: success");
	end else begin
		$display("TestCase#6: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
	A = 32'h7;
	B = 32'h8;
	#100;
	if (condition) begin
		$display("TestCase#7: success");
	end else begin
		$display("TestCase#7: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
	A = 32'h0;
	B = 32'ha;
	#100;
	if (condition) begin
		$display("TestCase#8: success");
	end else begin
		$display("TestCase#8: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d, Output carry save adder: %d, carry select adder: %d and Overflow Status carry save adder: %d, carry select adder: %d  Output Ripple adder: %d, Plus Adder: %d and Overflow Status  Ripple adder: %d,  PLus adder: %d,Output CSA32Adder: %d, CIA32Adder: %d and Overflow Status  CSA32 adder: %d,  CIA32 adder: %d", A, B, CLAResult, CByAResult, CLAOverflow, CByAOverflow, CarrySaveAdderResult, CarrySelectAdderResult, CarrySaveAdderoverflow, CarrySelectAdderoverflow,rippleResult,PlusVResult,RippleOverFlow,PlusOverFlow,CSA32Result,CIAResult,CSA32OverFlow,CIA32OverFlow);

	end
end
endmodule