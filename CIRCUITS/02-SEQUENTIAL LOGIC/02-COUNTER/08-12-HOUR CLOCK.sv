
    
    module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    wire[2:0]hms_en;
    
        assign hms_en = {ena&&(ss==8'h59)&&(mm==8'h59),((ss==8'h59)&&ena),ena};
    
    count60 s(.clk(clk),.reset(reset),.ena(hms_en[0]),.q(ss));
    count60 m(.clk(clk),.reset(reset),.ena(hms_en[1]),.q(mm));
    
    always@(posedge clk)
        begin
            if(reset)
                begin
                hh<=8'h12;
                pm=0;
                end 
            else 
                begin
                    if(hms_en[2])
                        begin
                            if(hh==8'h12)
                                hh<=8'h1;
                            else if (hh==8'h11)begin
                                hh[3:0]<=hh[3:0]+1'h1;
                                    pm<=~pm;
                            end
                                else
                                    begin
                                        if(hh[3:0]==8'h9)
                                            begin
                                                hh[3:0]<=4'h0;
                                                hh[7:4]<=hh[7:4]+1'h1;
                                            end 
                                        else 
                                            hh[3:0]<=hh[3:0]+1'h1;
                                    end 
                        end 
                    else 
                        hh<=hh;
                    
                end 
        end 
endmodule

module count60(clk,reset,ena,q);
    input clk,reset,ena;
    output [7:0]q;
    
    always@(posedge clk)
        begin
            if(reset)
                q<=8'h0;
            else
                begin
                    if(ena)
                        begin
                            if(q[3:0]==4'h9)begin
                                if(q[7:4]==4'h5)
                                        q<=8'h0;
                                else
                                    begin
                                        q[7:4]<=q[7:4]+1'h1;
                                        q[3:0]<=4'h0;
                                    end 
                            end
                            else 
                                begin
                                    q[3:0]<=q[3:0]+1'h1;
                                end 
                        end
                    else
                        q<=q;
                end
        end 
            endmodule 

