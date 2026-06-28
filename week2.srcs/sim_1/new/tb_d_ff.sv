`timescale 1ns / 1ps

module tb_d_ff();
  logic clk;
logic rstn;
   logic d;
 logic q;

    d_ff uut(
  .clk(clk),
 .rstn(rstn),
      .d(d),
 .q(q)
   );

 always #5 clk=~clk;

  initial begin
clk=0;
    rstn=0;
 d=0;
  #15 rstn=1;
     
 d=1;
   #10 d=0;
     #10 d=1;
  #10 d=1;
   #10 $finish;
 end
endmodule
