`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 10:39:28 AM
// Design Name: 
// Module Name: D_flip_4bit
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


module FF_D4(
    input clk,
    input [3:0] D,
    output [3:0] Q
    );
    reg [3:0]W;
    always @(posedge clk) begin
        W = D;
    end
    assign Q = W;
endmodule

