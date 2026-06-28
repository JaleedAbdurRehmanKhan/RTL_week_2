`timescale  1ns / 1ps

module tb_freq_div;

// freq_div Parameters
parameter PERIOD  = 10;


// freq_div Inputs
reg   clk_100_mhz                          = 0 ;
reg   rstn                                 = 0 ;

// freq_div Outputs
wire  logic clk_25_mhz                     ;


initial
begin
    forever #(PERIOD)  clk_100_mhz=~clk_100_mhz;
end

initial
begin
    #(PERIOD*2) rstn  =  1;
end

freq_div  u_freq_div (
    .clk_100_mhz             ( clk_100_mhz        ),
    .rstn                    ( rstn               ),

    . clk_25_mhz        (  clk_25_mhz   )
);

initial
begin
    #1000;
    $finish;
end

endmodule