`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 09:40:04 AM
// Design Name: 
// Module Name: freq_div
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


module freq_div(
    input clock,
    output [10:1]CP
    );

    ten div1(clock, CP[1]);
    ten div2(CP[1], CP[2]);
    ten div3(CP[2], CP[3]);
    ten div4(CP[3], CP[4]);
    ten div5(CP[4], CP[5]);
    ten div6(CP[5], CP[6]);
    ten div7(CP[6], CP[7]);
    ten div8(CP[7], CP[8]);
    ten div9(CP[8], CP[9]);
    ten div10(CP[9], CP[10]);
    
endmodule
