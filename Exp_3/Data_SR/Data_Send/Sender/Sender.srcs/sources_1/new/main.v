`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 09:35:24 AM
// Design Name: 
// Module Name: main
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


module main(
    input BTND, BTNL, BTNC,
    input CLK,
    input SW15,
    output LED0, LED1, LED2, LED3, LED15,
    output JB0,JB1,
    output CA, CB, CC, CD, CE, CF, CG, AN3, AN2, AN1, AN0
    );
    
    wire [3:0]CTN10out;
    wire triggerData;
    wire [3:0]data; // def MSB on the left hand side!!!

    // getting data to be transmitted
    assign triggerData = (BTNL && CLK) || BTNC;
    counter10 CTN10(CLK, 1'b0, CTN10out);
    FF_D4 D4_1(triggerData, CTN10out, data);

    //showing data
    assign {LED3,LED2,LED1,LED0} = data;
    STATIC_SHOW sta_show1(data,{CA, CB, CC, CD, CE, CF, CG}, {AN3, AN2, AN1, AN0});

    //getting low freq clk signal
    wire [10:1]clkAll;
    wire [1:0]clkOpt;
    wire clkUsed;
    freq_div f1(CLK, clkAll);
    assign clkOpt = {clkAll[5], clkAll[8]};
    mux2to1 M1(SW15, clkOpt,clkUsed);
    assign JB1 = clkUsed;

    //transmitting data
    wire sendOut;
    SR_8P SR1({1'b0, 1'b1, data, 1'b0, 1'b0}, clkUsed, BTND, sendOut);
    assign JB0 = sendOut;
    assign LED15 = sendOut;

endmodule
