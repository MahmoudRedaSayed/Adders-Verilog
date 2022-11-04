`include "full_adder.v"
 
module ripple_adder 
#(parameter N=16)(InputA,
                      InputB,
                      OutSum,
                      CarryOut,
                      OverFlow
                      );

  input [N-1:0] InputA,InputB;
  output [N-1:0] OutSum;
  output CarryOut,OverFlow;
  wire [N:0]     WireCarry;

  assign WireCarry[0]=0;
  assign CarryOut=WireCarry[N];
  assign OverFlow = (InputA[N-1] ^ OutSum[N-1]) & (InputB[N-1] ^ OutSum[N-1]);

  // Create the Full Adders
  genvar  i;
  generate
    for (i=0; i<N; i=i+1) 
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