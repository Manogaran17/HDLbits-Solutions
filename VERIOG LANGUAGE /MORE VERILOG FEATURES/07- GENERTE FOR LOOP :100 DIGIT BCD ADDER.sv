module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0]carry;
    
    genvar i;
    bcd_fadd a1(a[3:0],b[3:0],cin,carry[0],sum[3:0]);
    generate
        for(i=4;i<400;i=i+4)
        begin:full_adder
            bcd_fadd a2(a[i+3:i],b[i+3:i],carry[(i/4)-1],carry[i/4],sum[i+3:i]);
        end
    endgenerate
    
    assign cout=carry[99];

endmodule
