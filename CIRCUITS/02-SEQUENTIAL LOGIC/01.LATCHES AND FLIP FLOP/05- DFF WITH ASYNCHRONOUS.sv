module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    integer i;
    always@(posedge clk or posedge areset)
        begin
            if(areset)
                q<=0;
            else
                begin
                    for(i=0;i<8;i=i+1)
                        q[i]<=d[i];
                end 
        end 

endmodule
