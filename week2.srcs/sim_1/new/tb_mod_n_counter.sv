`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 03:46:07 PM
// Design Name: 
// Module Name: tb_mod_n_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mod_n_counter(

    );
     // Signal declarations
       logic clk;
       logic rstn;
       logic [3:0] q;

       // Instantiate the Unit Under Test (UUT)
      mod_n_counter #(.n(12)) uut  (
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
