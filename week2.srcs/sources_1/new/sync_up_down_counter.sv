`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 03:31:07 PM
// Design Name: 
// Module Name: sync_up_down_counter
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


module sync_up_down_counter(
    input clk,
    input rstn,up_down,
    output reg [3:0] q
    );
    always @ (posedge clk, negedge rstn) begin
    if (!rstn) q<=4'b0;
    else if(up_down) q <= q+1;
    else q <= q-1;
    
    end
    
endmodule
