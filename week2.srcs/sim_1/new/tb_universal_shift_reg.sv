`timescale 1ns / 1ps

module tb_universal_shift_reg();

    // Signal declarations
    logic clk;
    logic rstn;
    logic [1:0] sel;
    logic [3:0] p_in;
    logic s_left_in;
    logic s_right_in;
    logic [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    universal_reg uut (
        .clk(clk),
        .rstn(rstn),
        .sel(sel),
        .p_in(p_in),
        .s_left_in(s_left_in),
        .s_right_in(s_right_in),
        .q(q)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        sel = 2'b00;
        p_in = 4'b0000;
        s_left_in = 0;
        s_right_in = 0;
        
        #15 rstn = 1;
        
        // Parallel load
        p_in = 4'b1101;
        sel = 2'b11;
        #10;
        
        // Hold
        sel = 2'b00;
        #10;
        
        // Shift right
        s_right_in = 1;
        sel = 2'b01;
        #20;
        
        // Shift left
        s_left_in = 0;
        sel = 2'b10;
        #20;
        
        #30 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | rstn=%b | sel=%b | q=%b", $time, rstn, sel, q);
    end

endmodule
