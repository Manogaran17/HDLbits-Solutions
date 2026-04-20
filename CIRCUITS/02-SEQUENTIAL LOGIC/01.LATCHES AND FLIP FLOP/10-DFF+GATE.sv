module top_module (
    input clk,
    input in, 
    output out);
    wire w;
    
    d_ff a(.d(w),.clk(clk),.q(out));
    assign w = in^out;
    
endmodule

module d_ff(d,clk,q);
    input d,clk;
    output reg q;
    
    always@(posedge clk)
        begin
            q<=d;
        end 
endmodule 
