`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 10:13:25 AM
// Design Name: 
// Module Name: BCD_dec
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


module BCD_dec(
    input [3:0]D,
    output reg [6:0]Q
    );

    always @(D) begin
        case(D)
            0: Q = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1};
            1: Q = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1};
            2: Q = {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0};
            3: Q = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0};
            4: Q = {1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0};
            5: Q = {1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0};
            6: Q = {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
            7: Q = {1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1};
            8: Q = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
            9: Q = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0};
            default : Q = 1;
        endcase
    end
endmodule
