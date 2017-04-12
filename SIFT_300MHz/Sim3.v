`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:49:53 03/24/2016
// Design Name:   DoGUnit
// Module Name:   C:/Xilinx/ISE_Workspace/SIFT_TEST/Sim3.v
// Project Name:  SIFT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DoGUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sim3;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] Xin;
	reg [7:0] Yin;
	reg Directionin;
	reg [7:0] data1;
	reg [7:0] data2;
	reg [7:0] data3;
	reg [7:0] data4;
	reg [7:0] data5;

	// Outputs
	wire Directionout;
	wire [7:0] Xout;
	wire [7:0] Yout;
	wire [7:0] ImageReg1_1;
	wire [7:0] ImageReg1_2;
	wire [7:0] ImageReg1_3;
	wire [7:0] ImageReg1_4;
	wire [7:0] ImageReg1_5;
	wire [7:0] ImageReg2_1;
	wire [7:0] ImageReg2_2;
	wire [7:0] ImageReg2_3;
	wire [7:0] ImageReg2_4;
	wire [7:0] ImageReg2_5;
	wire [7:0] ImageReg3_1;
	wire [7:0] ImageReg3_2;
	wire [7:0] ImageReg3_3;
	wire [7:0] ImageReg3_4;
	wire [7:0] ImageReg3_5;
	wire [7:0] ImageReg4_1;
	wire [7:0] ImageReg4_2;
	wire [7:0] ImageReg4_3;
	wire [7:0] ImageReg4_4;
	wire [7:0] ImageReg4_5;
	wire [7:0] ImageReg5_1;
	wire [7:0] ImageReg5_2;
	wire [7:0] ImageReg5_3;
	wire [7:0] ImageReg5_4;
	wire [7:0] ImageReg5_5;

	// Instantiate the Unit Under Test (UUT)
	DoGUnit uut (
		.clk(clk), 
		.rst(rst), 
		.Xin(Xin), 
		.Yin(Yin), 
		.Directionin(Directionin), 
		.data1(data1), 
		.data2(data2), 
		.data3(data3), 
		.data4(data4), 
		.data5(data5), 
		.Directionout(Directionout), 
		.Xout(Xout), 
		.Yout(Yout), 
		.ImageReg1_1(ImageReg1_1), 
		.ImageReg1_2(ImageReg1_2), 
		.ImageReg1_3(ImageReg1_3), 
		.ImageReg1_4(ImageReg1_4), 
		.ImageReg1_5(ImageReg1_5), 
		.ImageReg2_1(ImageReg2_1), 
		.ImageReg2_2(ImageReg2_2), 
		.ImageReg2_3(ImageReg2_3), 
		.ImageReg2_4(ImageReg2_4), 
		.ImageReg2_5(ImageReg2_5), 
		.ImageReg3_1(ImageReg3_1), 
		.ImageReg3_2(ImageReg3_2), 
		.ImageReg3_3(ImageReg3_3), 
		.ImageReg3_4(ImageReg3_4), 
		.ImageReg3_5(ImageReg3_5), 
		.ImageReg4_1(ImageReg4_1), 
		.ImageReg4_2(ImageReg4_2), 
		.ImageReg4_3(ImageReg4_3), 
		.ImageReg4_4(ImageReg4_4), 
		.ImageReg4_5(ImageReg4_5), 
		.ImageReg5_1(ImageReg5_1), 
		.ImageReg5_2(ImageReg5_2), 
		.ImageReg5_3(ImageReg5_3), 
		.ImageReg5_4(ImageReg5_4), 
		.ImageReg5_5(ImageReg5_5)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		Xin = 0;
		Yin = 0;
		Directionin = 0;
		data1 = 0;
		data2 = 0;
		data3 = 0;
		data4 = 0;
		data5 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

