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
    input JA0, // sender data input
    input BTNL,BTNU,//BTNU for testing
    input CLK,
    input JA1,
    input SW15, // for selecting clk signal for testing

    output CA,CB,CC,CD,CE,CF,CG,AN0,AN1,AN2,AN3,
    output JB0, JB1, JB2, JB3,
    output LED4, LED3, LED2, LED1, LED0, // for SR1out[3:0]
    output LED8, LED7, LED6, LED5, //for DL1out
    output LED15 // for watching clk signal
    );

    parameter nbit = 8;

    //getiing clk signal
    wire psuedoCLK;
    assign psuedoCLK = (BTNL && CLK) || JA1;
    wire [10:1]clkAll;
    wire clkOpt;
    wire clkUsed;
    freq_div f1(CLK, clkAll);
    assign clkOpt = clkAll[8];
    mux2to1 M1(SW15, {clkOpt, psuedoCLK} ,clkUsed);
    assign LED15 = clkUsed;


    // get signal and trigger storage
    // SR1out[4] is for triggering data storage and reset, SR1out[3:0] is valid data signal.
    wire SR1clr;
    wire [nbit-1:0]SR1out;
    wire dataIn;
    assign dataIn = JA0 || BTNU;
    SR_NS_C #(.n(nbit))R1(dataIn, clkUsed, SR1clr ,SR1out);
    
    assign SR1clr = SR1out[4] && (~clkUsed);
    assign {JB3, JB2, JB1, JB0} = SR1out[3:0];
    assign {LED4, LED3, LED2, LED1, LED0} = SR1out[4:0];

    //storing data
    wire [3:0]DL1out;
    DLatchN #(.n(4))DL1(SR1out[3:0], SR1out[4], clkUsed, DL1out);

    //showing data
    
    STATIC_SHOW staticShow(DL1out, {CA,CB,CC,CD,CE,CF,CG}, {AN0,AN1,AN2,AN3});
    assign {LED8, LED7, LED6, LED5} = DL1out;


endmodule