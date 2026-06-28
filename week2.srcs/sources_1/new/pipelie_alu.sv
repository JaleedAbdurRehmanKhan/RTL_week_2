`timescale 1ns / 1ps

module pipelie_alu(
input logic clk,
  input logic rstn,
   input logic [2:0] op,
    input logic [31:0] a,
    input logic [31:0] b,
output logic [31:0] result
    );

    logic [31:0] a_reg_s1;
 logic [31:0] b_reg_s1;
  logic [2:0] op_reg_s1;


logic [31:0] alu_out_comb;

    logic [31:0] result_reg_s2;

   always_ff @(posedge clk, negedge rstn) begin
        if(!rstn) begin
  a_reg_s1 <= 32'b0;
b_reg_s1 <= 32'b0;
     op_reg_s1 <= 3'b0;
end 
else begin
         a_reg_s1<=a;
     b_reg_s1 <= b;
          op_reg_s1<= op;
        end
    end

  always_comb begin
    case(op_reg_s1)
  3'b000: alu_out_comb= a_reg_s1+b_reg_s1;
      3'b001: alu_out_comb = a_reg_s1 - b_reg_s1;
         3'b010: alu_out_comb=a_reg_s1 & b_reg_s1;
    3'b011: alu_out_comb= a_reg_s1 | b_reg_s1;
        3'b100: alu_out_comb=a_reg_s1^b_reg_s1;
default: alu_out_comb = 32'b0;
    endcase
  end

    always_ff @(posedge clk, negedge rstn) begin
   if(!rstn) result_reg_s2<= 32'b0;
      else 
 result_reg_s2<=alu_out_comb;
   end

assign result=result_reg_s2;

endmodule
