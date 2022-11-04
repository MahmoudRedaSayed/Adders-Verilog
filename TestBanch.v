module TestBanchFloatingPoint();
reg [31:0] InputA , InputB ;
wire [31:0] OutputRes;
wire exception;
integer T=100;
floatPointAdder FAdder(
                        InputA,InputB, 
                        exception,
                        OutputRes 
                    );
initial
begin
    // Test Case#1
    assign InputA=32'b01000111100110011111111100000100;
    assign InputB=32'b01000111100000111000111110001000;
    #T;
    if(OutputRes === 32'b01001000000011101100011101000110 )
    begin
        $display("#Test1 success");
    end
    else
    begin
        $display("#Test1 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;


    // Test Case#2
    assign InputA=32'b11000111010111011101010100000010;
    assign InputB=32'b11000110000110000001000000000010;
    #T;
    if(OutputRes=== 32'b11000111100000011110110010000001 )
    begin
        $display("#Test2 success");
    end
    else
    begin
        $display("#Test2 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;


    // Test Case#3
    assign InputA=32'b01000111100110011111111100000100;
    assign InputB=32'b11000111010111011101010100000010;
    #T;
    if(OutputRes=== 32'b01000110101011000101001000001100 )
    begin
        $display("#Test3 success");
    end
    else
    begin
        $display("#Test3 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

    // Test Case#4
    assign InputA=32'b11000110000110000001000000000010;
    assign InputB=32'b01000100001001001100010000000000;
    #T;
    
    if(OutputRes=== 32'b11000110000011011100001111000010 )
    begin
        $display("#Test4 success");
    end
    else
    begin
        $display("#Test4 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;


    // Test Case#5
    assign InputA=32'b01111111100000000000000000000000;
    assign InputB=32'b01000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test5 success");
    end
    else
    begin
        $display("#Test5 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

    // Test Case#6
    assign InputA=32'b01111111100000000000000000000000;
    assign InputB=32'b11000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test6 success");
    end
    else
    begin
        $display("#Test6 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;


    // Test Case#7
    assign InputA=32'b11111111100000000000000000000000;
    assign InputB=32'b11000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test7 success");
    end
    else
    begin
        $display("#Test7 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

    // Test Case#8
    assign InputA=32'b11111111100001010011000000000000;
    assign InputB=32'b01000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test8 success");
    end
    else
    begin
        $display("#Test8 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

    // Test Case#9
    assign InputA=32'b11111111100001010011000000000000;
    assign InputB=32'b11000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test9 success");
    end
    else
    begin
        $display("#Test9 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

    // Test Case#10
    assign InputA=32'b11111111100000000000000000000000;
    assign InputB=32'b11000001010010000000000000000000;
    #T;
    if(exception=== 1'b1 )
    begin
        $display("#Test10 success");
    end
    else
    begin
        $display("#Test10 Fail Data InputA=%b InputB=%b OutputRes=%b exception=%b ",InputA,InputB,OutputRes, exception);
    end
    #T;

end
endmodule
