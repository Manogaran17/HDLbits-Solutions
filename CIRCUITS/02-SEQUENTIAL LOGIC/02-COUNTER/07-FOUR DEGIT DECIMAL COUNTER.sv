module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    wire [3:0]q0,q1,q2,q3;
    
    bcd a(.clk1(clk),.reset1(reset),.enable1(1'b1),.q1(q0));
    bcd b(.clk1(clk),.reset1(reset),.enable1(ena[1]),.q1(q1));
    bcd c(.clk1(clk),.reset1(reset),.enable1(ena[2]),.q1(q2));
    bcd d(.clk1(clk),.reset1(reset),.enable1(ena[3]),.q1(q3));
            
    assign ena[1]=(q0==9);
    assign ena[2]=((q0==9)&&(q1==9));
    assign ena[3]=((q0==9)&&(q1==9)&&(q2==9));
    
    assign q = {q3,q2,q1,q0};
       
endmodule

            module bcd(clk1,reset1,enable1,q1);
                input clk1,reset1;
                input enable1;
                output reg [3:0]q1;
                
                always@(posedge clk1)
                    begin
                        if(reset1 || ((q1==4'd9)&&enable1))
                            q1<=0;
                        else
                            q1<=(enable1)?q1+1:q1;
                    end 
            endmodule 
