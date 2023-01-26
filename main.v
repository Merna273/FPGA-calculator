`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2022 07:40:02 PM
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
  
module main_1(clk1, rst,  B1, B2,  B3,  B4, B5,  B6,  B7,  B8, B9, anodes, enables, dc);
    input clk1, rst, B1, B2, B3, B4, B5, B6, B7, B8, B9;
    output reg [6:0] anodes;
    output reg [3:0] enables;
    output reg dc;
    wire dc_output_operations; 
    wire [3:0] digit1, digit2, digit3, digit4;
    wire [6:0] num1, num2, num3, num4;
    wire [3:0] incrementor_output1, incrementor_output2, incrementor_output3, incrementor_output4 ;
    wire main_clk_output;
    wire sychronizer_output1, sychronizer_output2, sychronizer_output3, sychronizer_output4, deboucer_output1, deboucer_output2, deboucer_output3, deboucer_output4, 
    detector_output1, detector_output2, detector_output3, detector_output4;
    
    Fast_Clock main_clock(clk1, rst, main_clk_output);
    
    
    incrementor i1(B1,main_clk_output, rst, incrementor_output1);
    incrementor i2(B2, main_clk_output, rst, incrementor_output2);
    incrementor i3(B3, main_clk_output, rst, incrementor_output3);
    incrementor i4(B4, main_clk_output, rst, incrementor_output4);
    
 
    operationsFileOnly o1(main_clk_output, incrementor_output1, incrementor_output2, incrementor_output3, incrementor_output4, 
    B5, B6, B7, B8, B9, digit1, digit2, digit3, digit4, dc_output_operations); 
    
    BCD bcd1(digit1, num1);
    BCD bcd2(digit2, num2); 
    BCD bcd3(digit3, num3); 
    BCD bcd4(digit4, num4); 

    reg[1:0] count;
    always@ (posedge main_clk_output)
    begin
    count <= count + 1;
    if (count == 0)
    begin
    dc=1'b1; 
    anodes = num1;
    enables = 4'b1110;
    end
    else if (count == 1)
    begin 
    dc=1'b1; 
    anodes = num2;
    enables = 4'b1101;
    end
    else if (count == 2)
    begin 
    if(dc_output_operations==1)begin
       dc = 1'b0; 
       end
       else if (dc_output_operations==0) begin
       dc= 1'b1;
       end
    anodes = num3;
    enables = 4'b1011;
    end
    else if (count == 3)
    begin 
    dc=1'b1;
    anodes = num4;
    enables = 4'b0111;
    end
    end
    endmodule 
      

