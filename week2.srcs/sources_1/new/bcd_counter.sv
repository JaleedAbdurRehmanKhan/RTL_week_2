`timescale 1ns/1ps


module bcd_counter (
input logic clk, rstn, 
output reg [3:0 ] counter
    );
    always @ (posedge clk, negedge rstn) begin
        if (!rstn) counter<=4'b0;
        else if( counter == 9)  counter<=4'b0;
        else counter<= counter + 1;
        end
    
endmodule