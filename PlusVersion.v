module PlusVersion 
#(parameter N=16)(InputA,
                    InputB,
                    OutSum,
                    CarryOut,
                    OverFlow
                    );
    input [N-1:0] InputA,InputB;
    output [N-1:0] OutSum;
    output CarryOut,OverFlow;

    assign {CarryOut,OutSum}=InputA+InputB;
    assign OverFlow = (InputA[N-1] ^ OutSum[N-1]) & (InputB[N-1] ^ OutSum[N-1]);

endmodule