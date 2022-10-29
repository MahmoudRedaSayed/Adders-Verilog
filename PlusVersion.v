
module PlusVersion 
#(parameter WIDTH=16)(InputA,
                    InputB,
                    OutSum,
                    CarryOut
                    );
    input [WIDTH-1:0] InputA,InputB;
    output [WIDTH-1:0] OutSum;
    output CarryOut;

    assign {CarryOut,OutSum}=InputA+InputB;

endmodule
