`timescale 1ns / 1ps

module siso(
    input logic clk, rstn, d,
    output logic q
);

logic [3:0] shift_reg;

always_ff @(posedge clk, negedge rstn) begin
    if(!rstn) shift_reg <= 0;
    else shift_reg <= {shift_reg[2:0], d};
end

assign q = shift_reg[3];

endmodule
