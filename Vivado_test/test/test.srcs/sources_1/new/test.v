`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 09:53:42 AM
// Design Name: 
// Module Name: test
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


module test(
    input SW15,SW14,SW13,SW12,SW11,SW10,SW9,SW8,SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0,
    input CLK,
    output CA, CB, CC, CD, CE, CF, CG,
    output AN3, AN2, AN1, AN0
    );
    
    wire    [10:0]  clkAll;
    freq_div clkGen(CLK, clkAll);
    dyn_show DS({SW15,SW14,SW13,SW12,SW11,SW10,SW9,SW8,SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0}, clkAll[4], {CA, CB, CC, CD, CE, CF, CG}, {AN3, AN2, AN1, AN0});
endmodule
