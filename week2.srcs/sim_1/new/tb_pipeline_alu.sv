`timescale 1ns / 1ps

module tb_pipeline_alu(

    );
    logic clk;
  logic rstn;
 logic [2:0] op;
     logic [31:0] a;
 logic [31:0] b;
   logic [31:0] result;

    pipelie_alu uut(
 .clk(clk),
    .rstn(rstn),
.op(op),
      .a(a),
  .b(b),
.result(result)
    );

   always #5 clk=~clk;

initial begin
   clk=0;
    rstn=0;
op=0;
 a=0;
    b=0;
        
     #15 rstn=1;
        
  op=3'b000;
      a=32'd10;
 b=32'd20;
    #10;
        
      op=3'b001;
 a=32'd50;
         b=32'd15;
    #10;
        
op=3'b010;
       a=32'hFFFF0000;
   b=32'h00FFFF00;
     #10;
        
  #30 $finish;
   end
    
 initial begin
  $monitor("Time=%0t | rstn=%b | op=%b | a=%0d | b=%0d | result=%0d", $time, rstn, op, a, b, result);
    end

endmodule
