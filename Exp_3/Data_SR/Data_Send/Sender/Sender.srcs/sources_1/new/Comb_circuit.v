`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 11:01:18 AM
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
            0: Q = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0};
            1: Q = {1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0};
            2: Q = {1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1};
            3: Q = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1};
            4: Q = {1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1};
            5: Q = {1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1};
            6: Q = {1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1};
            7: Q = {1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0};
            8: Q = {1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1};
            9: Q = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1};
            default : Q = 0;
        endcase
    end
endmodule

module STATIC_SHOW (
    input [3:0]D,
    output [6:0]LED_digit,
    output [3:0]enable
);

    wire [6:0]BCDcode;
    assign enable = 0;
    
    BCD_dec BCDdec(D, BCDcode);
    assign LED_digit = ~BCDcode;

endmodule //Comb_circuit

