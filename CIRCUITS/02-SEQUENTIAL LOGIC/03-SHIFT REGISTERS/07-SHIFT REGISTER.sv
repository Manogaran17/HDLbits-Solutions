module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire w1,w2,w3;
    
    my_dff a(.d(in),.clk(clk),.rstn(resetn),.q(w1));
    my_dff b(.d(w1),.clk(clk),.rstn(resetn),.q(w2));
    my_dff c(.d(w2),.clk(clk),.rstn(resetn),.q(w3));
    my_dff d(.d(w3),.clk(clk),.rstn(resetn),.q(out));
    
endmodule

module my_dff(d,clk,rstn,q);
    input d,clk,rstn;
    output reg q;
    
    always@(posedge clk)
        begin
            if(!rstn)
                q<=0;
            else 
                q<=d;
        end 
endmodule 
    

