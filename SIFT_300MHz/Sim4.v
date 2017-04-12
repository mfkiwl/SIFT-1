`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:56:57 03/24/2016
// Design Name:   DoGSum
// Module Name:   C:/Xilinx/ISE_Workspace/SIFT_TEST/Sim4.v
// Project Name:  SIFT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DoGSum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sim4;

	// Inputs
	reg clk;
	reg rst;
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

	// Outputs
	wire [16:0] DoG;

	// Instantiate the Unit Under Test (UUT)
	DoGSum uut (
		.clk(clk), 
		.rst(rst), 
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
		.ImageReg5_5(ImageReg5_5), 
		.DoG(DoG)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		ImageReg1_1 = 0;
		ImageReg1_2 = 0;
		ImageReg1_3 = 0;
		ImageReg1_4 = 0;
		ImageReg1_5 = 0;
		ImageReg2_1 = 0;
		ImageReg2_2 = 0;
		ImageReg2_3 = 0;
		ImageReg2_4 = 0;
		ImageReg2_5 = 0;
		ImageReg3_1 = 0;
		ImageReg3_2 = 0;
		ImageReg3_3 = 0;
		ImageReg3_4 = 0;
		ImageReg3_5 = 0;
		ImageReg4_1 = 0;
		ImageReg4_2 = 0;
		ImageReg4_3 = 0;
		ImageReg4_4 = 0;
		ImageReg4_5 = 0;
		ImageReg5_1 = 0;
		ImageReg5_2 = 0;
		ImageReg5_3 = 0;
		ImageReg5_4 = 0;
		ImageReg5_5 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

