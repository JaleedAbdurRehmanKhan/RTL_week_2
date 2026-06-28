`timescale 1ns/1ps

module t_ff (
    input rstn, clk, t,
    output reg q
);

always @(posedge clk, negedge rstn) begin
    if(!rstn) q<=0;
    else if (t) q<=~q;
    else q<=q;
end
    
endmodule