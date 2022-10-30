
module mux2x1 (input x, input y, input select, output out);

assign out = (select)?  y: x;

endmodule