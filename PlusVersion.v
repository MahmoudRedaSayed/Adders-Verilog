module PlusVersion 
#(parameter WIDTH=16)(InputA,
                    InputB,
                    OutSum,
                    CarryOut,
                    OverFlow
                    );
    input [WIDTH-1:0] InputA,InputB;
    output [WIDTH-1:0] OutSum;
    output CarryOut,OverFlow;

    assign {CarryOut,OutSum}=InputA+InputB;
    assign OverFlow = (InputA[31] ^ OutSum[31]) & (InputB[31] ^ OutSum[31]);

endmodule