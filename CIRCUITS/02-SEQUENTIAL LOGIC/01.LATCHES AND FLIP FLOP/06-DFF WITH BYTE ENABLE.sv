module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
    
);
    integer i,j,k;
    always@(posedge clk)
        begin
            if(!resetn)
                q<=0;
            else 
                begin
                    if(byteena==2'b01)
                    begin
                    for(i=0;i<8;i=i+1)
                        q[i]<=d[i];
                    end 
                    else if (byteena==2'b10)
                               begin
                    for(j=8;j<16;j=j+1)
                        q[j]<=d[j];
                               end 
                    else if(byteena==2'b11)
                    begin
                        for(k=0;k<16;k=k+1)
                            q[k]<=d[k];
                    end 
                    else if(byteena==2'b00)
                        q<=q;
                                     
                end 
        end 
endmodule

