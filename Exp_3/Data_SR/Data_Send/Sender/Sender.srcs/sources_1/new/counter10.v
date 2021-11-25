`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 10:25:24 AM
// Design Name: 
// Module Name: counter10
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


module counter10(
    input clk,
    input reset,
    output [3:0] Q
    );
    reg [3:0]number;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            number = 0;
        end
        else if(number < 9) begin
            number = number+1;
        end
        else
            number = 0;
    end
    assign Q = number;
endmodule
