`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2026 12:33:04 PM
// Design Name: 
// Module Name: async_up_down_counter
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


module async_up_down_counter(
    input logic clk,
    input logic rstn, up_down,
    output  reg [3:0] q
    );
    
   
    wire clk1  = (up_down)  ? ~q[0] : q[0];
    wire clk2  = (up_down)  ? ~q[1] : q[1];
    wire clk3  = (up_down)  ? ~q[2] : q[2];

    always @( posedge clk, negedge rstn) begin
    if(!rstn) q[0] <= 1'b0;
    else q[0]<= ~q[0];
    end
    
    always @(posedge clk1, negedge rstn) begin
    if(!rstn) q[1] <= 1'b0;
    else  q[1] <=~q[1]; // will count upwards if up_down 1 
    end
    
        always @(posedge clk2, negedge rstn) begin
    if(!rstn) q[2] <= 1'b0;
    else  q[2] <=~q[2]; // will count upwards if up_down 1 
    end
    
        always @(posedge clk3, negedge rstn) begin
    if(!rstn) q[3] <= 1'b0;
    else  q[3] <=~q[3]; // will count upwards if up_down 1 
    end
    
    
    
endmodule
