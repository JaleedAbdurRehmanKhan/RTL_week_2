`timescale 1ns / 1ps

module sipo(
    input logic clk, rstn,
    input logic d,
    output logic [3:0] q
);

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) q <= 4'b0;
    else q <= {q[2:0], d};
end

endmodule
