`timescale 1ns / 1ps

module t_using_d_ff(
 input logic clk,
  input logic rstn,
   input logic t,
 output logic q
);
  logic d_in;

  assign d_in= t ? ~q : q;

   d_ff uut_d(
.clk(clk),
    .rstn(rstn),
 .d(d_in),
   .q(q)
  );
endmodule
