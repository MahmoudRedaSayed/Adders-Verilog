`include "full_adder.v"
 
module ripple_adder_with_carry
#(parameter WIDTH=4)(InputA,
                      InputB,
		      Carryin,
                      OutSum,
                      CarryOut
                      );

  input [WIDTH-1:0] InputA,InputB;
input Carryin;
  output [WIDTH-1:0] OutSum;
  output CarryOut;
  wire [WIDTH:0]     WireCarry;

  assign WireCarry[0]=Carryin;
  assign CarryOut=WireCarry[WIDTH];

  // Create the Full Adders
  genvar  i;
  generate
    for (i=0; i<WIDTH; i=i+1) 
      begin
        full_adder full_adder_inst
            ( 
              .i_bit1(InputA[i]),
              .i_bit2(InputB[i]),
              .i_carry(WireCarry[i]),
              .o_sum(OutSum[i]),
              .o_carry(WireCarry[i+1])
              );
      end
  endgenerate
endmodule
