module top_module (input x, input y, output z);
    wire w1,w2,w3,w4;

    assign w1=(x^y)&x;
    assign w2=~(x^y);
    or(w3,w1,w2);
    and(w4,w1,w2);
    xor(z,w3,w4);
    
endmodule
