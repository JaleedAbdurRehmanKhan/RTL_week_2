`timescale 1ns / 1ps

module tb_jk_ff();
 logic clk;
   logic rstn;
logic j;
  logic k;
   logic q;

  jk_ff uut(
 .clk(clk),
   .rstn(rstn),
.j(j),
     .k(k),
  .q(q)
   );

 always #5 clk=~clk;

  initial begin
clk=0;
  rstn=0;
 j=0;
  k=0;
    #15 rstn=1;
     
j=0; k=1;
   #10 j=1; k=0;
     #10 j=1; k=1;
  #10 j=1; k=1;
 #10 j=0; k=0;
   #10 $finish;
 end
endmodule
