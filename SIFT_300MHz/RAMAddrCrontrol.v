`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:10 03/17/2016 
// Design Name: 
// Module Name:    RAMAddrCrontrol 
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
module RAMAddrControl_Parallel_5(
input clk,
input rst,
output reg Directionout,
output reg [7:0] Xout,
output reg [7:0] Yout,
output reg [15:0] addr1,
output reg [15:0] addr2,
output reg [15:0] addr3,
output reg [15:0] addr4,
output reg [15:0] addr5
    );
	 
parameter Iwidth = 256;
parameter Ilength = 256;
parameter DoGwidth = 251;
parameter DoGlength = 251;
reg direction;
reg [7:0] x;
reg [7:0] y;

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
			Directionout <= direction;
			Xout <= x;
			Yout <= y;
		end
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			direction <= 0;
			y <= 0;
			x <= 0;
			addr1 <= 0;
			addr2 <= 0;
			addr3 <= 0;
			addr4 <= 0;
			addr5 <= 0;
		end
	else if(x == DoGwidth)
		begin
			if(direction == 0)
				begin
					addr1 <= (5+y)*Iwidth + DoGwidth;
					addr2 <= (5+y)*Iwidth + DoGwidth+1;
					addr3 <= (5+y)*Iwidth + DoGwidth+2;
					addr4 <= (5+y)*Iwidth + DoGwidth+3;
					addr5 <= (5+y)*Iwidth + DoGwidth+4;
				end
			else if(direction == 1)
				begin
					addr1 <= (5+y)*Iwidth;
					addr2 <= (5+y)*Iwidth + 1;
					addr3 <= (5+y)*Iwidth + 2;
					addr4 <= (5+y)*Iwidth + 3;
					addr5 <= (5+y)*Iwidth + 4;
				end
			x <= 0;
			if(y < DoGlength)
				y <= y+1;
			else
				y <= 0;
			
			direction <= ~direction;
		end
	else
		begin
			x <= x + 1;
				begin
					case(direction)
					0: 
						begin
							addr1 <= y*Iwidth + x+5;
							addr2 <= (y+1)*Iwidth +x+5;
							addr3 <= (y+2)*Iwidth + x+5;
							addr4 <= (y+3)*Iwidth + x+5;
							addr5 <= (y+4)*Iwidth + x+5;
						end
					1:
						begin
							addr1 <= y*Iwidth - x + DoGwidth - 1;
							addr2 <= (y+1)*Iwidth - x + DoGwidth - 1;
							addr3 <= (y+2)*Iwidth - x + DoGwidth - 1;
							addr4 <= (y+3)*Iwidth - x + DoGwidth - 1;
							addr5 <= (y+4)*Iwidth - x + DoGwidth - 1;
						end
					endcase
				end
		end
end

endmodule
