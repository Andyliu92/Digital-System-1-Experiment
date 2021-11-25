`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 09:49:04 AM
// Design Name: 
// Module Name: ten
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


module ten(
    input clock,
    output ten
    );
    reg [3:0]Q;
    always @(posedge clock) begin
        if (Q <= 8) begin
            Q = Q + 1;
        end
        else
            Q = 0;
    end
    assign ten = Q[3];
endmodule
