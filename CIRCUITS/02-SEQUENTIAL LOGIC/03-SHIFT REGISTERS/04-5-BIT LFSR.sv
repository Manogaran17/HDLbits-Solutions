module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire w1,w2;
    
    my_dff a(.d(w1),.clk(clk),.rst(reset),.rst1(0),.q(q[4]));
    my_dff b(.d(q[4]),.clk(clk),.rst(reset),.rst1(0),.q(q[3]));
    my_dff c(.d(w2),.clk(clk),.rst(reset),.rst1(0),.q(q[2]));
    my_dff d(.d(q[2]),.clk(clk),.rst(reset),.rst1(0),.q(q[1]));
    my_dff e(.d(q[1]),.clk(clk),.rst(reset),.rst1(1),.q(q[0]));
    
    xor g1(w1,1'b0,q[0]);
    xor g2(w2,q[3],q[0]);
    

endmodule

module my_dff(d,clk,rst,rst1,q);
    input d,clk,rst,rst1;
    output reg q;
    
    always@(posedge clk)
        begin
            if(rst)
                q<=rst1;
            else
                q<=d;
        end 
endmodule 

