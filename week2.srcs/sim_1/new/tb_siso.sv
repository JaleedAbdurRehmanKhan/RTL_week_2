`timescale 1ns / 1ps

module tb_siso(

    );
logic clk = 0;
logic rstn = 0;
logic d = 0;
logic q;

siso uut (
    .clk(clk),
    .rstn(rstn),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rstn = 0;
    d = 0;
    #10;
    rstn=1;
    #10;
    d=1;
    #10;
    d=0;
    #10;
    d=1;
    #10;
    d=0;
    #10;
    d=1;
    #10;
    d=0;
    #10;
    d=1;
    #10;
    d=0;
    #10;
    d=1;
    #10;
    $finish;
end
endmodule
