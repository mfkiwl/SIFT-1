`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:43:25 03/22/2016 
// Design Name: 
// Module Name:    Keypoint 
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
module Keypoint(
input clk,
input rst,
input signed [16:0] DoG_1_1,
input signed [16:0] DoG_1_2,
input signed [16:0] DoG_1_3,

input signed [16:0] DoG_2_1,
input signed [16:0] DoG_2_2,
input signed [16:0] DoG_2_3,

input signed [16:0] DoG_3_1,
input signed [16:0] DoG_3_2,
input signed [16:0] DoG_3_3,

output reg keypoint
    );
 
reg [15:0] clk_count;
reg [0:0] keypointRAM [65535:0];

always @(posedge clk or posedge rst)
begin
	if(rst == 1||clk_count==65535)
		clk_count <= 0;
	else
		clk_count <= clk_count + 1;
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		keypoint <= 0;
	else
		if((DoG_1_1!=0)&&(DoG_1_2!=0)&&(DoG_1_3!=0)&&
		((DoG_2_2>7573 && DoG_2_2>DoG_1_1 && DoG_2_2>DoG_1_2 && DoG_2_2>DoG_1_3 &&DoG_2_2>DoG_2_1 && DoG_2_2>DoG_2_3&&DoG_2_2>DoG_3_1 && DoG_2_2>DoG_3_2 && DoG_2_2>DoG_3_3)
		||(DoG_2_2<-7573 && DoG_2_2<DoG_1_1 && DoG_2_2<DoG_1_2 && DoG_2_2<DoG_1_3&&DoG_2_2<DoG_2_1 && DoG_2_2<DoG_2_3&&DoG_2_2<DoG_3_1 && DoG_2_2<DoG_3_2 && DoG_2_2<DoG_3_3)))
			begin
				keypoint <= 1;
				keypointRAM[clk_count] <= 1;
			end
		else
			begin
				keypoint <= 0;
				keypointRAM[clk_count] <= 0;
			end
end


endmodule
