`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 09:48:15 AM
// Design Name: 
// Module Name: dyn_show
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


module dyn_show(
    input   wire    [15:0]  Data,
    input   wire            clk,
    output  wire    [6:0]   LED,
    output  reg     [3:0]   LED_en
    );

    reg     [1:0]   state;
    reg     [3:0]   selected;

    BCD_dec BCD(selected, LED);

    always @(posedge clk)begin
        case (state)
            0: {selected,LED_en} <= {Data[3:0]   ,4'b1110};
            1: {selected,LED_en} <= {Data[7:4]   ,4'b1101};
            2: {selected,LED_en} <= {Data[11:8]  ,4'b1011};
            3: {selected,LED_en} <= {Data[15:12] ,4'b0111};
        endcase
        state <= state+1;
    end
endmodule
