`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 10:45:32 AM
// Design Name: 
// Module Name: SR_16_4BIT_BLOCK
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


module SR_16_4BIT_BLOCK(
    input   wire    [3:0]   data,
    input   wire            en,
    input                   clk,
    output  reg     [15:0]  Q
    );

    always @(negedge clk) begin
        if(en)
            Q = {Q[11:0], data};
    end
endmodule
