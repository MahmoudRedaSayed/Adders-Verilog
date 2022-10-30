module CLAAndCByAAdder_tb;
reg [31:0] A, B;
wire [31:0] CLAResult, CByAResult;
wire CLACarryOut, CByACarryOut;
cla32bit claAdder(A, B, CLAResult, CLACarryOut);
cbya32bit cbyaAdder(A, B, CByAResult, CByACarryOut);
initial begin
	A = 32'b0;
        B = 32'b0; 
	#100;
	A = 32'h7fffffff; // overflow of 2 positive numbers
	B = 32'h1;
	#100;
	if (CLAResult === 32'h80000000 && CLACarryOut === 1'b0 && CByAResult === 32'h80000000 && CByACarryOut === 1'b0) begin
		$display("TestCase#1: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'hffffffff; // overflow of 2 negative numbers
	B = 32'h80000000;
	#100;
	if (CLAResult === 32'h7fffffff && CLACarryOut === 1'b1 && CByAResult === 32'h7fffffff && CByACarryOut === 1'b1) begin
		$display("TestCase#2: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'h2; // addition of 2 - 5 = -3 (hfffffffd)
	B = 32'hfffffffb;
	#100;
	if (CLAResult === 32'hfffffffd && CLACarryOut === 1'b0 && CByAResult === 32'hfffffffd && CByACarryOut === 1'b0) begin
		$display("TestCase#3: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'hc; // addition of 12 + 25 = 37 (h25)
	B = 32'h19;
	#100;
	if (CLAResult === 32'h25 && CLACarryOut === 1'b0 && CByAResult === 32'h25 && CByACarryOut === 1'b0) begin
		$display("TestCase#4: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'hfffffffb; // addition of -5 - 12 = -17 (hffffffef)
	B = 32'hfffffff4;
	#100;
	if (CLAResult === 32'hffffffef && CLACarryOut === 1'b1 && CByAResult === 32'hffffffef && CByACarryOut === 1'b1) begin 
		$display("TestCase#5: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'h2;
	B = 32'h1;
	#100;
	if (CLAResult === 32'h3 && CLACarryOut === 1'b0 && CByAResult === 32'h3 && CByACarryOut === 1'b0) begin
		$display("TestCase#6: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'h7;
	B = 32'h8;
	#100;
	if (CLAResult === 32'hf && CLACarryOut === 1'b0 && CByAResult === 32'hf && CByACarryOut === 1'b0) begin
		$display("TestCase#7: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
	A = 32'h0;
	B = 32'ha;
	#100;
	if (CLAResult === 32'ha && CLACarryOut === 1'b0 && CByAResult === 32'ha && CByACarryOut === 1'b0) begin
		$display("TestCase#8: success");
	end else begin
		$display("TestCase#1: failed with Input %d, %d, Output CLA: %d, CByA: %d and Overflow Status CLA: %d, CByA: %d", A, B, CLAResult, CByAResult, CLACarryOut, CByACarryOut);
	end
end
endmodule