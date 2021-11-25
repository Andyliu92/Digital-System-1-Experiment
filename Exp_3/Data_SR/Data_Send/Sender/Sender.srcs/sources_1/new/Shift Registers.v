`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 10:45:13 AM
// Design Name: 
// Module Name: SR_8P
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


module SR_8P(
    input [7:0] DataIn,
    input clk,
    inout load,
    output reg Q
    );

    reg [7:0]ShiftData;
    always @(posedge clk) begin
        if (load) begin
            ShiftData <= DataIn;
            Q <= 0;
        end
        else begin
            Q <= ShiftData[7];
            ShiftData <= {ShiftData[6:0],1'b0};
        end
    end
endmodule
