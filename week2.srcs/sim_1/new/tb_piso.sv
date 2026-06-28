`timescale 1ns / 1ps

module tb_piso();

    // Signal declarations
    logic clk;
    logic rstn;
    logic load;
    logic [3:0] d;
    logic q;

    // Instantiate the Unit Under Test (UUT)
    piso uut (
        .clk(clk),
        .rstn(rstn),
        .load(load),
        .d(d),
        .q(q)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        load = 0;
        d = 4'b0000;
        
        #15 rstn = 1;
        
        // Load data
        d = 4'b1011;
        load = 1;
        #10 load = 0;
        
        #50 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | rstn=%b | load=%b | d=%b | q=%b", $time, rstn, load, d, q);
    end

endmodule
