`timescale 1ns / 1ps

module d_ff(
input logic clk,
  input logic rstn,
input logic d,
    output logic q
  );

  always_ff @(posedge clk, negedge rstn) begin
   if(!rstn) q<=1'b0;
     else q <=d;
 end
endmodule
