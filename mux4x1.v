
module mux4x1 (input [3:0] x, input [3:0] y, input select, output [3:0] out);

assign out = (select)?  y: x;

endmodule