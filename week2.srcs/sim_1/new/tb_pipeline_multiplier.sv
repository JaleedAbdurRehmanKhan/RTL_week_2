`timescale 1ns / 1ps

module tb_pipeline_multiplier(

    );
 logic clk;
   logic rstn;
logic [31:0] a;
     logic [31:0] b;
  logic [63:0] product;

  pipeline_multiplier uut(
.clk(clk),
   .rstn(rstn),
 .a(a),
    .b(b),
.product(product)
    );

    always #5 clk=~clk;

initial begin
  clk=0;
 rstn=0;
       a=0;
   b=0;
        
 #15 rstn=1;
        
      a=32'd5;
b=32'd4;
     #10;
        
 a=32'd100;
      b=32'd20;
    #10;
        
      a=32'hFFFF;
b=32'h2;
   #10;
        
        #30 $finish;
   end
    
initial begin
    $monitor("Time=%0t | rstn=%b | a=%0d | b=%0d | product=%0d", $time, rstn, a, b, product);
    end

endmodule
