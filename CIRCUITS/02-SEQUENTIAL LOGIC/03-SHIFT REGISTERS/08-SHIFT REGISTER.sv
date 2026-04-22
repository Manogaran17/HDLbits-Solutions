module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
    
); //
    
    MUXDFF a(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]),
           b(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]),
           c(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]),
           d(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);
 
endmodule

module MUXDFF (clk,E,L,w,R,Q);
    input clk;
    input E,R,L,w;
    output Q;
    wire w1,w2,w3;
    
    mux a(.i0(w3),.i1(w),.s(E),.y(w1));
    mux b(.i0(w1),.i1(R),.s(L),.y(w2));
    
    my_dff(.d(w2),.clk(clk),.q(Q)); 
    
    assign w3 = Q;
    

endmodule

module mux(i0,i1,s,y);
    input i0,i1,s;
    output y;
    
    assign y = s?i1:i0;
endmodule 

module my_dff(d,clk,q);
    input d,clk;
    output q;
    
    always@(posedge clk)
        begin
            q<=d;
        end 
endmodule 
    
    

