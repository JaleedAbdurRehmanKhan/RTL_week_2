`timescale 1ns / 1ps

module piso(
    input logic clk, rstn,
    input logic load,
    input logic [3:0] d,
    output logic q
);

logic [3:0] shift_reg;

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) shift_reg <= 4'b0;
    else if (load) shift_reg <= d;
    else shift_reg <= {shift_reg[2:0], 1'b0};
end

assign q = shift_reg[3];

endmodule
