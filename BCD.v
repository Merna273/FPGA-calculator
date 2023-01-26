`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2022 07:30:35 PM
// Design Name: 
// Module Name: BCD
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


module BCD(ip,  op);
input [4:0] ip;
wire [3:0] sel; 
output reg [6:0] op;

always @(ip) begin
case(ip) //active low
    4'b0000 : op = 7'b0000001;
    4'b0001 : op = 7'b1001111;
    4'b0010 : op = 7'b0010010;
    4'b0011 : op = 7'b0000110;
    4'b0100 : op = 7'b1001100;
    4'b0101 : op = 7'b0100100;
    4'b0110 : op = 7'b0100000;
    4'b0111 : op = 7'b0001111;
    4'b1000 : op = 7'b0000000;
    4'b1001 : op = 7'b0000100;
    4'b1010 : op = 7'b1111110;
    4'b1011 : op = 7'b0111001;
    4'b1100 : op = 7'b0110000;
    4'b1101 : op = 7'b1111111;

    default : op = 7'b0000000;  
endcase
end
endmodule