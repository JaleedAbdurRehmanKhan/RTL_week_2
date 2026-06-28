`timescale 1ns / 1ps

module tb_bcd_counter(

    );
     // Signal declarations
       logic clk;
       logic rstn;
       logic [3:0] q;

       // Instantiate the Unit Under Test (UUT)
      bcd_counter  uut  (
           .clk(clk),
           .rstn(rstn),
           .counter(q)
       );
   
       // Clock generation (10ns period)
       always #5 clk = ~clk;
   
       // Test sequence
       initial begin
           // Initialize signals
           clk = 0;
           rstn = 0;
           #10;
           rstn=1;
     #200;
     $finish;
           end
endmodule
