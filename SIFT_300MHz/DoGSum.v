`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:53:54 03/24/2016 
// Design Name: 
// Module Name:    DoGSum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DoGSum(
input clk,
input rst,

input [7:0] ImageReg1_1,
input [7:0] ImageReg1_2,
input [7:0] ImageReg1_3,
input [7:0] ImageReg1_4,
input [7:0] ImageReg1_5,

input [7:0] ImageReg2_1,
input [7:0] ImageReg2_2,
input [7:0] ImageReg2_3,
input [7:0] ImageReg2_4,
input [7:0] ImageReg2_5,

input [7:0] ImageReg3_1,
input [7:0] ImageReg3_2,
input [7:0] ImageReg3_3,
input [7:0] ImageReg3_4,
input [7:0] ImageReg3_5,

input [7:0] ImageReg4_1,
input [7:0] ImageReg4_2,
input [7:0] ImageReg4_3,
input [7:0] ImageReg4_4,
input [7:0] ImageReg4_5,

input [7:0] ImageReg5_1,
input [7:0] ImageReg5_2,
input [7:0] ImageReg5_3,
input [7:0] ImageReg5_4,
input [7:0] ImageReg5_5,

output reg [16:0] DoG
    );

always @(posedge
always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		DoG <= 0;
	else
		DoG <= //476*ImageReg3_3
				 233*ImageReg1_3 + ImageReg3_1 + ImageReg3_5 + ImageReg5_3;
				//- 5*(ImageReg2_3 + ImageReg3_2 + ImageReg3_4 + ImageReg4_3)
				//+ 3*(ImageReg1_2 + ImageReg1_4 + ImageReg2_1 + ImageReg2_5 + ImageReg4_1 + ImageReg4_5 + ImageReg5_2 + ImageReg5_4)
				//+ 114*(ImageReg1_1 + ImageReg1_5 + ImageReg5_1 + ImageReg5_5);
				
end

endmodule
