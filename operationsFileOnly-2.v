`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2022 07:28:45 PM
// Design Name: 
// Module Name: operationsFileOnly
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


module operationsFileOnly(in0, in1, in2, in3, B5, B6, B7, B8, B9, out0, out1, out2, out3, dc_output);
input [3:0] in0, in1, in2, in3; //each one represents one digit of the displayed numbers
input B5, B6, B7, B8, B9; 
reg [13:0] outM;
reg [7:0] outA, outD; // the 4 digits output
reg [8:0] outS;
reg dc_operations;
output reg [3:0] out0, out1, out2, out3;
output reg dc_output ; // each digit of the output is given to each one for the display 
 reg [3:0] negSign;
reg [6:0] n1, n2, rem;
//integer choice; //for which B to click 
//wire [6:0] bcd0, bcd1, bcd2, bcd3; //connect each bcd to the correct place in the constraint file
//BCD(out0, bcd0);
//BCD(out1, bcd1);
//BCD(out2, bcd2);
//BCD(out3, bcd3);
always @ (*)begin
    dc_operations = 1;
    if (B5) begin //B5
    dc_operations = 0;
      n1 = in2 + (in3 * 10); //1st no.
      n2 = in0 + (in1 * 10); //2nd no.
      outA= (n1+n2); 
      out0 = outA % 10;
      outA = outA / 10;
      out1 = outA % 10;
      outA = outA / 10;
      out2 = outA % 10;
      out3 = 0;
      end 
    else if (B6) begin //B6
        dc_operations = 0;
            n1 = in2 + (in3 * 10); //1st no.
              n2 = in0 + (in1 * 10); //2nd no.
              
              if(n1 >= n2) begin
              outS= n1-n2;
              out0 = outS % 10;
              outS = outS / 10;
              out1 = outS % 10;
              outS = outS / 10;
              out2 = outS % 10;
              out3 = 0;
            end
              else if (n2 > n1) begin
            outS = n2 - n1;
            negSign = 10;
              out0 = outS % 10;
              outS = outS / 10;
              out1 = outS % 10;
              out2 = negSign;
              out3 = 0;
              end
              end
  
   
    else if (B7) begin //B7
        dc_operations=0;

      n1 = in2 + (in3 * 10); //1st no.
      n2 = in0 + (in1 * 10); //2nd no.
      outM = n1 * n2;
      out0 = outM % 10;
      outM = outM / 10;
      out1 = outM % 10;
      outM = outM / 10;
      out2 = outM % 10;
      outM = outM / 10;
      out3 = outM % 10;
    end
    else if (B8) begin //B8
        dc_operations=0;
         n1 = in2 + (in3 * 10); //1st no.
             n2 = in0 + (in1 * 10); //2nd no.
               if(n2 == 0)begin // if n1/0 then the output will show err
                   out0 = 11;
                   out1 = 11;
                   out2 = 12;
                   out3 = 13;
               end
               else begin
               outD = n1 / n2;
               rem = outD * n2;
               rem = n1 - rem;
           rem = rem * 10;
           rem = rem / n2;
               if (rem >= 5) begin
               outD = outD + 1;
               end
               else begin
               outD = outD;
               end
              out0 = outD % 10;
               outD = outD / 10;
               out1 = outD % 10;
               out2 = 0;
               out3 = 0;
               end
              end
    else if(B9) begin // B9 
    
      out0 = in0;
      out1 = in1; 
      out2 = in2;
      out3 = in3;
    end
    else begin
      out0 = in0;
      out1 = in1; 
      out2 = in2;
      out3 = in3;
    end
     if(dc_operations==1) begin
       dc_output = 1;
       end 
       else 
       dc_output = 0; 
    end
   
    
    

    endmodule
