`timescale 1ns / 1ps

module universal_reg(
    input logic clk, rstn,
    input logic [1:0] sel,
    input logic [3:0] p_in,
    input logic s_left_in,
    input logic s_right_in,
    output logic [3:0] q
);

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) q <= 4'b0;
    else if (sel == 2'b00) q <= q;
    else if (sel == 2'b01) q <= {s_right_in, q[3:1]};
    else if (sel == 2'b10) q <= {q[2:0], s_left_in};
    else if (sel == 2'b11) q <= p_in;
end

endmodule
