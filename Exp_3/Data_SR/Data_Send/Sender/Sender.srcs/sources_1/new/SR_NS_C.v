`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2021 08:02:21 AM
// Design Name: 
// Module Name: SR_NS_C
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

module SR_NS_C(Data, clk, clr, Q);
    parameter n = 8;
    input Data;
    input clk, clr;
    output reg [n-1:0] Q;

    always @(posedge clk) begin
        if(clr)
            Q = 0;
        else
            Q = {Q[n-2:0], Data};
    end
endmodule
