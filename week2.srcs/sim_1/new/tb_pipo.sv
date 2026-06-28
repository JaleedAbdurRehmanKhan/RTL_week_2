`timescale 1ns / 1ps

module tb_pipo();

    // Signal declarations
    logic clk;
    logic rstn;
    logic [3:0] d;
    logic [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    pipo uut (
        .clk(clk),
        .rstn(rstn),
        .d(d),
        .q(q)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        d = 4'b0000;
        
        #15 rstn = 1;
        
        #10 d = 4'b1010;
        #10 d = 4'b0101;
        #10 d = 4'b1111;
        
        #20 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | rstn=%b | d=%b | q=%b", $time, rstn, d, q);
    end

endmodule
