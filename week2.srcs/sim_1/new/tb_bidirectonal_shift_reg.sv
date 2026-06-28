`timescale 1ns / 1ps

module tb_bidirectonal_shift_reg();

    // Signal declarations
    logic clk;
    logic rstn;
    logic dir;
    logic d;
    logic [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    bidirection_shift_reg uut (
        .clk(clk),
        .rstn(rstn),
        .dir(dir),
        .d(d),
        .q(q)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        dir = 0;
        d = 0;
        
        #15 rstn = 1;
        
        // Shift left
        dir = 1;
        d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        
        #20;
        
        // Shift right
        dir = 0;
        d = 0;
        #10 d = 1;
        #10 d = 0;
        
        #30 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | rstn=%b | dir=%b | d=%b | q=%b", $time, rstn, dir, d, q);
    end

endmodule
