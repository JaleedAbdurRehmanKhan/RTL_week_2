`timescale 1ns / 1ps

module bidirection_shift_reg(
    input logic clk, rstn,
    input logic dir, 
    input logic d,
    output logic [3:0] q
);

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) q <= 4'b0;
    else if (dir) q <= {q[2:0], d};
    else q <= {d, q[3:1]};
end

endmodule
