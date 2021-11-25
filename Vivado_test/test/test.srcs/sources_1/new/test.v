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
    input SW0,SW1,SW2,SW3,SW4,SW5,SW6,
    output CA, CB, CC, CD, CE, CF, CG,
    output AN0, AN1, AN2, AN3
    );
    assign AN0 = 0;
    assign AN1 = 0;
    assign AN2 = 0;
    assign AN3 = 0;

    assign CA = SW0;
    assign CB = SW1;
    assign CC = SW2;
    assign CD = SW3;
    assign CE = SW4;
    assign CF = SW5;
    assign CG = SW6;
endmodule
