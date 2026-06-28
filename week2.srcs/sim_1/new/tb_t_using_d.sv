`timescale 1ns / 1ps

module tb_t_using_d();
   logic clk;
 logic rstn;
logic t;
  logic q;

 t_using_d_ff uut(
.clk(clk),
   .rstn(rstn),
 .t(t),
   .q(q)
   );

 always #5 clk=~clk;

  initial begin
clk=0;
    rstn=0;
 t=0;
    #15 rstn=1;
     
 t=1;
   #20 t=0;
     #10 t=1;
   #10 $finish;
 end
endmodule
