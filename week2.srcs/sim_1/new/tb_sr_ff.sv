`timescale 1ns / 1ps

module tb_sr_ff();
   logic clk;
 logic rstn;
  logic s;
 logic r;
   logic q;

 sr_ff uut(
  .clk(clk),
.rstn(rstn),
    .s(s),
 .r(r),
   .q(q)
   );

 always #5 clk=~clk;

  initial begin
 clk=0;
  rstn=0;
   s=0;
 r=0;
    #15 rstn=1;
     
  s=0; r=1;
   #10 s=1; r=0;
     #10 s=0; r=0;
  #10 s=1; r=1;
   #10 $finish;
 end
endmodule
