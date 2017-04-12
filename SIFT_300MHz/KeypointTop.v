`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:46 03/19/2016 
// Design Name: 
// Module Name:    DoGTop 
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
module KeypointTop(
input clk,
input rst,

output [16:0] DoG_1_1,
output [16:0] DoG_1_2,
output [16:0] DoG_1_3,

output [16:0] DoG_2_1,
output [16:0] DoG_2_2,
output [16:0] DoG_2_3,

output [16:0] DoG_3_1,
output [16:0] DoG_3_2,
output [16:0] DoG_3_3,

output keypoint
    );

wire [7:0] X;
wire [7:0] Y;
wire Direction;
wire [7:0] X2;
wire [7:0] Y2;
wire Direction2;


wire [15:0] addr1;
wire [15:0] addr2;
wire [15:0] addr3;
wire [15:0] addr4;
wire [15:0] addr5;

wire [7:0] data1;
wire [7:0] data2;
wire [7:0] data3;
wire [7:0] data4;
wire [7:0] data5;

wire [7:0] data;
	
wire [16:0] DoG;
/*
wire [16:0] DoG_1_1;
wire [16:0] DoG_1_2;
wire [16:0] DoG_1_3;

wire [16:0] DoG_2_1;
wire [16:0] DoG_2_2;
wire [16:0] DoG_2_3;

wire [16:0] DoG_3_1;
wire [16:0] DoG_3_2;
wire [16:0] DoG_3_3;
*/

//wire keypoint;

RAMAddrControl_Parallel_5 Addr (
		.clk(clk), 
		.rst(rst), 
		.Directionout(Direction), 
		.Xout(X), 
		.Yout(Y),
		.addr1(addr1), 
		.addr2(addr2), 
		.addr3(addr3), 
		.addr4(addr4), 
		.addr5(addr5)
	);
	
ImageRAM ImageRAM1 (
  .clka(clk), // input clka
  .wea(0), // input [0 : 0] wea
  .addra(addr1), // input [15 : 0] addra
  .dina(0), // input [7 : 0] dina
  .douta(data1), // output [7 : 0] douta
  .clkb(clk), // input clkb
  .web(0), // input [0 : 0] web
  .addrb(addr2), // input [15 : 0] addrb
  .dinb(0), // input [7 : 0] dinb
  .doutb(data2) // output [7 : 0] doutb
);

ImageRAM ImageRAM2 (
  .clka(clk), // input clka
  .wea(0), // input [0 : 0] wea
  .addra(addr3), // input [15 : 0] addra
  .dina(0), // input [7 : 0] dina
  .douta(data3), // output [7 : 0] douta
  .clkb(clk), // input clkb
  .web(0), // input [0 : 0] web
  .addrb(addr4), // input [15 : 0] addrb
  .dinb(0), // input [7 : 0] dinb
  .doutb(data4) // output [7 : 0] doutb
);

ImageRAM ImageRAM3 (
  .clka(clk), // input clka
  .wea(0), // input [0 : 0] wea
  .addra(addr5), // input [15 : 0] addra
  .dina(0), // input [7 : 0] dina
  .douta(data5), // output [7 : 0] douta
  .clkb(0), // input clkb
  .web(0), // input [0 : 0] web
  .addrb(0), // input [15 : 0] addrb
  .dinb(0), // input [7 : 0] dinb
  .doutb(data) // output [7 : 0] doutb
);

DoGUnit DoGU (
		.clk(clk), 
		.rst(rst), 
		.Xin(X), 
		.Yin(Y), 
		.Directionin(Direction), 
		.data1(data1), 
		.data2(data2), 
		.data3(data3), 
		.data4(data4), 
		.data5(data5), 
		.Directionout(Direction2), 
		.Xout(X2), 
		.Yout(Y2), 
		.DoG(DoG)
	);


ExtremaPointMatrix ExtremaPM (
		.clk(clk), 
		.rst(rst), 
		.Xin(X2), 
		.Yin(Y2), 
		.Directionin(Direction2), 
		.DoG(DoG), 
		.DoG_1_1(DoG_1_1), 
		.DoG_1_2(DoG_1_2), 
		.DoG_1_3(DoG_1_3), 
		.DoG_2_1(DoG_2_1), 
		.DoG_2_2(DoG_2_2), 
		.DoG_2_3(DoG_2_3), 
		.DoG_3_1(DoG_3_1), 
		.DoG_3_2(DoG_3_2), 
		.DoG_3_3(DoG_3_3)
	);


Keypoint KeypointU (
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

endmodule
