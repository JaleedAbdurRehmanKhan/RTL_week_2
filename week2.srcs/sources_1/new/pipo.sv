`timescale 1ns / 1ps

module pipo(
    input logic clk, rstn,
    input logic [3:0] d,
    output logic [3:0] q
);

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) q <= 4'b0;
    else q <= d;
end

endmodule
