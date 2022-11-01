module SkipLogic(output cin_next,
    input [3:0] a, b, input cin, cout);

    wire p0, p1, p2, p3, P, e;

    xor (p0, a[0], b[0]);
    xor (p1, a[1], b[1]);
    xor (p2, a[2], b[2]);
    xor (p3, a[3], b[3]);

    and (P, p0, p1, p2, p3);
    and (e, P, cin);

    or (cin_next, e, cout);
endmodule
