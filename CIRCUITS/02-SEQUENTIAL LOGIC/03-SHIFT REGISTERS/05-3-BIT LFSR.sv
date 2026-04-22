module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire w;
    assign w = LEDR[1]^LEDR[2];
    
    submod a(KEY[0],SW[0],LEDR[2],KEY[1],LEDR[0]),
           b(KEY[0],SW[1],LEDR[0],KEY[1],LEDR[1]),
           c(KEY[0],SW[2],w,KEY[1],LEDR[2]);
    
endmodule

module submod(clk,rin,qin,l,q);
    input rin,qin;
    input l,clk;
    output reg q;
    
    wire d;
    
    dff (.d(d),.clk(clk),.q(q));
    mux (.i1(qin),.i2(rin),.s(l),.y(d));
    
endmodule 

module dff (d,clk,q);
    input d,clk;
    output q;
    
    always@(posedge clk)
        begin
            q<=d;
        end 
endmodule 

module mux(i1,i2,s,y);
    input i1,i2,s;
    output y;
    
    assign y=s?i2:i1;
    
endmodule 


    
