module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire cin,cout[3:0];
    assign cin=0;
    
    fa p(x[0],y[0],cin,sum[0],cout[0]);
    fa q(x[1],y[1],cout[0],sum[1],cout[1]);
    fa r(x[2],y[2],cout[1],sum[2],cout[2]);
    fa s(x[3],y[3],cout[2],sum[3],cout[3]);
    
    assign sum[4] = cout[3];
    

endmodule

module fa(a,b,ci,s,carry);
    input a,b,ci;
    output s,carry;
    
    assign s = a^b^ci;
    assign carry = a&b|ci&(a^b);
endmodule 
    

