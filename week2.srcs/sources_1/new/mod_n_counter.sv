`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 03:42:33 PM
// Design Name: 
// Module Name: mod_n_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mod_n_counter #(parameter  n=4)(
input logic clk, rstn, 
output reg [3:0 ] counter
    );
    always @ (posedge clk, negedge rstn) begin
        if (!rstn) counter<=4'b0;
        else if( counter == n)  counter<=4'b0;
        else counter<= counter + 1;
        end
    
endmodule
