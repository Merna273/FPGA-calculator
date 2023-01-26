`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2022 07:31:08 PM
// Design Name: 
// Module Name: incrementor
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

module incrementor(input B, clk, rst, output reg[3:0] out);
reg push_f;
reg push_sync; 
reg push_sync_f; 
wire push_edge; 

    always @(posedge clk) begin
    push_f <= B;
    push_sync <= push_f;
    end
    
    always @ (posedge clk) begin
    if(rst)
    push_sync_f <= 0;
    else 
    push_sync_f <= push_sync;
    end
    assign push_edge = push_sync & ~push_sync_f;
    
    always @ (posedge clk) begin
    if(rst)
    out <= 0;
    if(push_edge)begin
        if( out!=9 )begin
            out <= out+1;
            end
        else begin
        out<=0;
        end
     end
    
  end
endmodule 
 
