module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar i;
    
    fa FA(a[0],b[0],cin,sum[0],cout[0]);
    generate 
        for(i=1;i<100;i=i+1) begin:full_adder
            fa FA(a[i],b[i],cout[i-1],sum[i],cout[i]);  
        end  
    endgenerate
    
endmodule

module fa (a,b,cin,s,cout);
    input a,b,cin;
    output s,cout;
    
    assign s=(a^b^cin);
    assign cout=(a&b)|cin&(a^b);
endmodule 

    

