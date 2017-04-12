`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:09 03/18/2016 
// Design Name: 
// Module Name:    PorocessUnit 
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
module DoGUnit(
input clk,
input rst,

input [7:0] Xin,
input [7:0] Yin,
input Directionin,
input [7:0] data1,
input [7:0] data2,
input [7:0] data3,
input [7:0] data4,
input [7:0] data5,

output reg Directionout,
output reg [7:0] Xout,
output reg [7:0] Yout,
output reg signed [16:0] DoG

    );

parameter DoGwidth = 251;



reg [7:0] x;
reg [7:0] y;
reg direction;

reg [7:0] x1;
reg [7:0] y1;
reg direction1;

reg [7:0] x2;
reg [7:0] y2;
reg direction2;

reg [7:0] ImageReg1_1;
reg [7:0] ImageReg1_2;
reg [7:0] ImageReg1_3;
reg [7:0] ImageReg1_4;
reg [7:0] ImageReg1_5;

reg [7:0] ImageReg2_1;
reg [7:0] ImageReg2_2;
reg [7:0] ImageReg2_3;
reg [7:0] ImageReg2_4;
reg [7:0] ImageReg2_5;

reg [7:0] ImageReg3_1;
reg [7:0] ImageReg3_2;
reg [7:0] ImageReg3_3;
reg [7:0] ImageReg3_4;
reg [7:0] ImageReg3_5;

reg [7:0] ImageReg4_1;
reg [7:0] ImageReg4_2;
reg [7:0] ImageReg4_3;
reg [7:0] ImageReg4_4;
reg [7:0] ImageReg4_5;

reg [7:0] ImageReg5_1;
reg [7:0] ImageReg5_2;
reg [7:0] ImageReg5_3;
reg [7:0] ImageReg5_4;
reg [7:0] ImageReg5_5;

reg [16:0] product3_3;
reg [16:0] product1_3;
reg [16:0] product3_1;
reg [16:0] product3_5;
reg [16:0] product5_3;
reg [16:0] product2_3;
reg [16:0] product3_2;
reg [16:0] product3_4;
reg [16:0] product4_3;
reg [16:0] product1_2;
reg [16:0] product1_4;
reg [16:0] product2_1;
reg [16:0] product2_5;
reg [16:0] product4_1;
reg [16:0] product4_5;
reg [16:0] product5_2;
reg [16:0] product5_4;
reg [16:0] product1_1;
reg [16:0] product1_5;
reg [16:0] product5_1;
reg [16:0] product5_5;

reg [16:0] sum_product1;
reg [16:0] sum_product2;
reg [16:0] sum_product3;
reg [16:0] sum_product4;
reg [16:0] sum_product5;

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			direction <= 0;
			x <= 0;
			y <= 0;
		end
	else
		begin
			direction <= Directionin;
			x <= Xin;
			y <= Yin;
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			direction1 <= 0;
			x1 <= 0;
			y1 <= 0;
		end
	else
		begin
			direction1 <= direction;
			x1 <= x;
			y1 <= y;
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			direction2 <= 0;
			x2 <= 0;
			y2 <= 0;
		end
	else
		begin
			direction2 <= direction1;
			x2 <= x1;
			y2 <= y1;
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			Directionout <= 0;
			Xout <= 0;
			Yout <= 0;
		end
	else
		begin
				Xout <= x2;
				Yout <= y2;
				Directionout <= direction2;
		end
end

reg [1:0] clk_div;

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		clk_div <= 0;
	else if(clk_div > 2)
		clk_div <= clk_div;
	else
		clk_div <= clk_div + 1;
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			ImageReg1_1 <= 161;
			ImageReg1_2 <= 162;
			ImageReg1_3 <= 161;
			ImageReg1_4 <= 161;
			ImageReg1_5 <= 163;
			
			ImageReg2_1 <= 163;
			ImageReg2_2 <= 162;
			ImageReg2_3 <= 161;
			ImageReg2_4 <= 161;
			ImageReg2_5 <= 164;
			
			ImageReg3_1 <= 163;
			ImageReg3_2 <= 161;
			ImageReg3_3 <= 160;
			ImageReg3_4 <= 162;
			ImageReg3_5 <= 162;
			
			ImageReg4_1 <= 160;
			ImageReg4_2 <= 159;
			ImageReg4_3 <= 159;
			ImageReg4_4 <= 160;
			ImageReg4_5 <= 160;
			
			ImageReg5_1 <= 156;
			ImageReg5_2 <= 157;
			ImageReg5_3 <= 158;
			ImageReg5_4 <= 158;
			ImageReg5_5 <= 159;
		end
		
	else
		if(clk_div > 1)
			begin
				if(x==DoGwidth)
					begin
						ImageReg1_1 <= ImageReg2_1;
						ImageReg1_2 <= ImageReg2_2;
						ImageReg1_3 <= ImageReg2_3;
						ImageReg1_4 <= ImageReg2_4;
						ImageReg1_5 <= ImageReg2_5;
						
						ImageReg2_1 <= ImageReg3_1;
						ImageReg2_2 <= ImageReg3_2;
						ImageReg2_3 <= ImageReg3_3;
						ImageReg2_4 <= ImageReg3_4;
						ImageReg2_5 <= ImageReg3_5;
						
						ImageReg3_1 <= ImageReg4_1;
						ImageReg3_2 <= ImageReg4_2;
						ImageReg3_3 <= ImageReg4_3;
						ImageReg3_4 <= ImageReg4_4;
						ImageReg3_5 <= ImageReg4_5;
						
						ImageReg4_1 <= ImageReg5_1;
						ImageReg4_2 <= ImageReg5_2;
						ImageReg4_3 <= ImageReg5_3;
						ImageReg4_4 <= ImageReg5_4;
						ImageReg4_5 <= ImageReg5_5;
						
						ImageReg5_1 <= data1;
						ImageReg5_2 <= data2;
						ImageReg5_3 <= data3;
						ImageReg5_4 <= data4;
						ImageReg5_5 <= data5;
					end
				else if(direction == 0 && x<DoGwidth)
					begin
						ImageReg1_1 <= ImageReg1_2;
						ImageReg2_1 <= ImageReg2_2;
						ImageReg3_1 <= ImageReg3_2;
						ImageReg4_1 <= ImageReg4_2;
						ImageReg5_1 <= ImageReg5_2;
						
						ImageReg1_2 <= ImageReg1_3;
						ImageReg2_2 <= ImageReg2_3;
						ImageReg3_2 <= ImageReg3_3;
						ImageReg4_2 <= ImageReg4_3;
						ImageReg5_2 <= ImageReg5_3;
						
						ImageReg1_3 <= ImageReg1_4;
						ImageReg2_3 <= ImageReg2_4;
						ImageReg3_3 <= ImageReg3_4;
						ImageReg4_3 <= ImageReg4_4;
						ImageReg5_3 <= ImageReg5_4;
						
						ImageReg1_4 <= ImageReg1_5;
						ImageReg2_4 <= ImageReg2_5;
						ImageReg3_4 <= ImageReg3_5;
						ImageReg4_4 <= ImageReg4_5;
						ImageReg5_4 <= ImageReg5_5;

						ImageReg1_5 <= data1;
						ImageReg2_5 <= data2;
						ImageReg3_5 <= data3;
						ImageReg4_5 <= data4;
						ImageReg5_5 <= data5;
					end
				else if(direction == 1 && x<DoGwidth)
					begin
						ImageReg1_5 <= ImageReg1_4;
						ImageReg2_5 <= ImageReg2_4;
						ImageReg3_5 <= ImageReg3_4;
						ImageReg4_5 <= ImageReg4_4;
						ImageReg5_5 <= ImageReg5_4;
						
						ImageReg1_4 <= ImageReg1_3;
						ImageReg2_4 <= ImageReg2_3;
						ImageReg3_4 <= ImageReg3_3;
						ImageReg4_4 <= ImageReg4_3;
						ImageReg5_4 <= ImageReg5_3;
						
						ImageReg1_3 <= ImageReg1_2;
						ImageReg2_3 <= ImageReg2_2;
						ImageReg3_3 <= ImageReg3_2;
						ImageReg4_3 <= ImageReg4_2;
						ImageReg5_3 <= ImageReg5_2;
						
						ImageReg1_2 <= ImageReg1_1;
						ImageReg2_2 <= ImageReg2_1;
						ImageReg3_2 <= ImageReg3_1;
						ImageReg4_2 <= ImageReg4_1;
						ImageReg5_2 <= ImageReg5_1;
						
						ImageReg1_1 <= data1;
						ImageReg2_1 <= data2;
						ImageReg3_1 <= data3;
						ImageReg4_1 <= data4;
						ImageReg5_1 <= data5;
					end
				end
end


always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			product3_3 <= 0;
			product1_3 <= 0;
			product3_1 <= 0;
			product3_5 <= 0;
			product5_3 <= 0;
			product2_3 <= 0;
			product3_2 <= 0;
			product3_4 <= 0;
			product4_3 <= 0;
			product1_2 <= 0;
			product1_4 <= 0;
			product2_1 <= 0;
			product2_5 <= 0;
			product4_1 <= 0;
			product4_5 <= 0;
			product5_2 <= 0;
			product5_4 <= 0;
			product1_1 <= 0;
			product1_5 <= 0;
			product5_1 <= 0;
			product5_5 <= 0;
		end
	else
		begin
			product3_3 <= 476*ImageReg3_3;
			product1_3 <= 233*ImageReg1_3;
			product3_1 <= 233*ImageReg3_1;
			product3_5 <= 233*ImageReg3_5;
			product5_3 <= 233*ImageReg5_3;
			
			product2_3 <= 5*ImageReg2_3;
			product3_2 <= 5*ImageReg3_2;
			product3_4 <= 5*ImageReg3_4;
			product4_3 <= 5*ImageReg4_3;
			
			product1_2 <= 3*ImageReg1_2;
			product1_4 <= 3*ImageReg1_4;
			product2_1 <= 3*ImageReg2_1;
			product2_5 <= 3*ImageReg2_5;
			product4_1 <= 3*ImageReg4_1;
			product4_5 <= 3*ImageReg4_5;
			product5_2 <= 3*ImageReg5_2;
			product5_4 <= 3*ImageReg5_4;
			
			product1_1 <= 114*ImageReg1_1;
			product1_5 <= 114*ImageReg1_5;
			product5_1 <= 114*ImageReg5_1;
			product5_5 <= 114*ImageReg5_5;
		end
end


always@(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			sum_product1 <= 0;
			sum_product2 <= 0;
			sum_product3 <= 0;
			sum_product4 <= 0;
			sum_product5 <= 0;
		end
	else
		begin
			sum_product1 <= product1_3+product3_1+product3_5+product5_3;
			sum_product2 <= product2_3+product3_2+product3_4+product4_3;
			sum_product3 <= product1_2+product1_4+product2_1+product2_5+product4_1;
			sum_product4 <= product4_5+product5_2+product5_4+product3_3;
			sum_product5 <= product1_1+product1_5+ product5_1+product5_5;
		end
		/*
		DoG <= product3_3
				-product1_3-product3_1-product3_5-product5_3
		      -product2_3-product3_2-product3_4-product4_3
		      +product1_2+product1_4+product2_1+product2_5+product4_1+product4_5+product5_2+product5_4
		      +product1_1+product1_5+ product5_1+product5_5;
		*/
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		DoG <= 0;
	else
		DoG <= sum_product3 + sum_product4 + sum_product5 - sum_product1 - sum_product2;
end
		
endmodule
