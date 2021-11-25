`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2021 12:24:30 PM
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
    input JA0,
    input BTNL,
    input CLK,
    input JA1,

    output CA,CB,CC,CD,CE,CF,CG,AN0,AN1,AN2,AN3,
    output JB0, JB1, JB2, JB3
    );

    parameter nbit = 8;

    //psuedo clk signal
    wire clkUsed;
    assign clkUsed = (BTNL && CLK) || JA1;

    // get signal and trigger storage
    // SR1out[4] is for triggering data storage and reset, SR1out[3:0] is valid data signal.
    wire SR1clr;
    wire [nbit-1:0]SR1out;
    SR_NS_C #(.n(nbit))R1(JA0, clkUsed, SR1clr,SR1out);
    assign SR1clr = SR1out[4] && (~clkUsed);
    assign {JB3, JB2, JB1, JB0} = SR1out;

    //storing data
    wire [3:0]DL1out;
    DLatchN #(.n(4))DL1(SR1out[3:0], SR1out[4], DL1out);

    //showing data
    STATIC_SHOW staticShow(DL1out, {CA,CB,CC,CD,CE,CF,CG}, {AN0,AN1,AN2,AN3});


endmodule