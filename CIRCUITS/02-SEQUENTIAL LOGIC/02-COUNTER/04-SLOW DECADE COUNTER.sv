module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    reg[3:0]count;
    always@(posedge clk)
        begin
            if(reset ||(count==4'd9&&slowena))
                count<=0;
            else if(count<9&&slowena)
                count<=count+1;
            else if(slowena==0)
                count<=count;
        end 
    assign q=count;
endmodule

