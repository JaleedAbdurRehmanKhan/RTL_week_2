`timescale 1ns / 1ps

module pipeline_multiplier(
  input logic clk,
input logic rstn,
   input logic [31:0] a,
 input logic [31:0] b,
    output logic [63:0] product
);

 logic [31:0] a_reg_s1;
   logic [31:0] b_reg_s1;

 logic [63:0] mult_out_comb;

logic [63:0] result_reg_s2;

always_ff @(posedge clk, negedge rstn) begin
       if(!rstn) begin
a_reg_s1<=32'b0;
  b_reg_s1<=32'b0;
      end 
      else begin
           a_reg_s1<=a;
   b_reg_s1<=b;
        end
    end

assign mult_out_comb=a_reg_s1 * b_reg_s1;

    always_ff @(posedge clk, negedge rstn) begin
 if(!rstn) result_reg_s2<=64'b0;
 else result_reg_s2<= mult_out_comb;
    end

  assign product= result_reg_s2;

endmodule
