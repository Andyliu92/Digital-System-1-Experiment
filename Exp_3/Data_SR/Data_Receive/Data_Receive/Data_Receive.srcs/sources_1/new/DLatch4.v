`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2021 12:30:28 PM
// Design Name: 
// Module Name: DLatchN
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


module DLatchN(Data, set, clk, Q);
    parameter n = 4;
    input [n-1:0]Data;
    input set,clk;
    output reg [n-1:0]Q;

    always @(negedge clk) begin
        if (set) begin
            Q = Data;
        end
    end
endmodule
