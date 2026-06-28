`timescale 1ns / 1ps

module tb_sync_up_down_counter();

    // Signal declarations
    logic clk;
    logic rstn;
    logic up_down;
    logic [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    sync_up_down_counter uut (
        .clk(clk),
        .rstn(rstn),
        .up_down(up_down),
        .q(q)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;
        up_down = 0;

        // Apply reset
        #20 rstn = 1;

        // Test Count Up (up_down = 1)
        up_down = 1;
        #100;

        // Test Count Down (up_down = 0)
        up_down = 0;
        #100;

        // Assert reset again
        #10 rstn = 0;
        #20 rstn = 1;

        #50 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | rstn=%b | up_down=%b | q=%b", $time, rstn, up_down, q);
    end

endmodule