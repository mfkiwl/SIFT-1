`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:36:41 03/24/2016
// Design Name:   KeypointTop
// Module Name:   C:/Xilinx/ISE_Workspace/SIFT_TEST/Sim2.v
// Project Name:  SIFT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KeypointTop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sim2;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [16:0] DoG_1_1;
	wire [16:0] DoG_1_2;
	wire [16:0] DoG_1_3;
	wire [16:0] DoG_2_1;
	wire [16:0] DoG_2_2;
	wire [16:0] DoG_2_3;
	wire [16:0] DoG_3_1;
	wire [16:0] DoG_3_2;
	wire [16:0] DoG_3_3;
	wire keypoint;

	// Instantiate the Unit Under Test (UUT)
	KeypointTop uut (
		.clk(clk), 
		.rst(rst), 
		.DoG_1_1(DoG_1_1), 
		.DoG_1_2(DoG_1_2), 
		.DoG_1_3(DoG_1_3), 
		.DoG_2_1(DoG_2_1), 
		.DoG_2_2(DoG_2_2), 
		.DoG_2_3(DoG_2_3), 
		.DoG_3_1(DoG_3_1), 
		.DoG_3_2(DoG_3_2), 
		.DoG_3_3(DoG_3_3), 
		.keypoint(keypoint)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
		#5
		rst = 1;
		clk = 1;
		
		#5
		rst = 1;
		clk = 0;
		
		#5
		rst = 1;
		clk = 1;
		
		#5
		rst = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		forever #5 clk = ~clk; 

	end
      
endmodule

