module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]num1,num2;
    
    assign num1=(a>b)?b:a;
    assign num2=(num1>c)?c:num1;
    assign min=(num2>d)?d:num2;
    // assign intermediate_result1 = compare? true: false;

endmodule
