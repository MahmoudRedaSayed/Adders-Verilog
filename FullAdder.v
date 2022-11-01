
module FullAdder ( input a, input b, input cin, output sum, output cout );
wire p;
assign p = a ^ b;
assign sum = p ^ cin;
assign cout = (p & cin) | (a & b);        
endmodule