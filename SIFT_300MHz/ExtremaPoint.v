`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:45 03/19/2016 
// Design Name: 
// Module Name:    ExtremaPoint 
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
module ExtremaPointMatrix(
input clk,
input rst,
input [7:0] Xin,
input [7:0] Yin,
input Directionin,
input [16:0] DoG,
output reg signed [16:0] DoG_1_1,
output reg signed [16:0] DoG_1_2,
output reg signed [16:0] DoG_1_3,

output reg signed [16:0] DoG_2_1,
output reg signed [16:0] DoG_2_2,
output reg signed [16:0] DoG_2_3,

output reg signed [16:0] DoG_3_1,
output reg signed [16:0] DoG_3_2,
output reg signed [16:0] DoG_3_3
    );

parameter DoGwidth = 251;

reg signed [16:0] RAM0 [251:0];
reg signed [16:0] RAM1 [251:0];
reg signed [16:0] RAM2 [251:0];
reg signed [16:0] RAM3 [251:0];

integer i;
reg [2:0] row1;
reg [7:0] Y;

always @(posedge clk or posedge rst)
begin
	if(rst == 1)
		begin
			row1 <= 0;
			DoG_1_1 <= 0;
			DoG_1_2 <= 0;
			DoG_1_3 <= 0;
			
			DoG_2_1 <= 0;
			DoG_2_2 <= 0;
			DoG_2_3 <= 0;
			
			DoG_3_1 <= 0;
			DoG_3_2 <= 0;
			DoG_3_3 <= 0;
			
			for(i=0;i<=DoGwidth;i=i+1)
				begin
					RAM0[i] <= 0;
					RAM1[i] <= 0;
					RAM2[i] <= 0;
					RAM3[i] <= 0;
				end
				
		end
	else
		if(Xin < DoGwidth - 1)
			begin
				case(row1)
				0:	
					begin  
						RAM0[Xin] <= DoG; 
						DoG_1_1 <= RAM1[Xin];  
						DoG_1_2 <= RAM1[Xin+1];  
						DoG_1_3 <= RAM1[Xin+2];
						
						DoG_2_1 <= RAM2[Xin];  
						DoG_2_2 <= RAM2[Xin+1];
						DoG_2_3 <= RAM2[Xin+2];
						
						DoG_3_1 <= RAM3[Xin];  
						DoG_3_2 <= RAM3[Xin+1];
						DoG_3_3 <= RAM3[Xin+2];
					end
				1: 
					begin  
						RAM1[DoGwidth - Xin] <= DoG; 
						DoG_1_1 <= RAM2[Xin];  
						DoG_1_2 <= RAM2[Xin+1];  
						DoG_1_3 <= RAM2[Xin+2];
						
						DoG_2_1 <= RAM3[Xin];  
						DoG_2_2 <= RAM3[Xin+1];
						DoG_2_3 <= RAM3[Xin+2];
						
						DoG_3_1 <= RAM0[Xin];  
						DoG_3_2 <= RAM0[Xin+1];
						DoG_3_3 <= RAM0[Xin+2];
					end
				2: 
					begin  
						RAM2[Xin] <= DoG; 
						DoG_1_1 <= RAM3[Xin];  
						DoG_1_2 <= RAM3[Xin+1];  
						DoG_1_3 <= RAM3[Xin+2];
						
						DoG_2_1 <= RAM0[Xin];  
						DoG_2_2 <= RAM0[Xin+1];
						DoG_2_3 <= RAM0[Xin+2];
						
						DoG_3_1 <= RAM1[Xin];  
						DoG_3_2 <= RAM1[Xin+1];
						DoG_3_3 <= RAM1[Xin+2];
					end
				3: 
					begin  
						RAM3[DoGwidth - Xin] <= DoG; 
						DoG_1_1 <= RAM0[Xin];  
						DoG_1_2 <= RAM0[Xin+1];  
						DoG_1_3 <= RAM0[Xin+2];
						
						DoG_2_1 <= RAM1[Xin];  
						DoG_2_2 <= RAM1[Xin+1];
						DoG_2_3 <= RAM1[Xin+2];
						
						DoG_3_1 <= RAM2[Xin];  
						DoG_3_2 <= RAM2[Xin+1];
						DoG_3_3 <= RAM2[Xin+2];
					end
				endcase
			end
		else
			begin
				case(row1)
				0:	begin RAM0[Xin] <= DoG; end
				1: begin RAM1[DoGwidth - Xin] <= DoG; end
				2: begin RAM2[Xin] <= DoG; end
				3: begin RAM3[DoGwidth - Xin] <= DoG; end
				endcase
				
				DoG_1_1 <= 0;
				DoG_1_2 <= 0;  
				DoG_1_3 <= 0;
				
				DoG_2_1 <= 0; 
				DoG_2_2 <= 0;  
				DoG_2_3 <= 0; 
				
				DoG_3_1 <= 0; 
				DoG_3_2 <= 0;  
				DoG_3_3 <= 0; 
				
				if(Xin == 251)
					begin
						if(row1 < 3)
							row1 <= row1 + 1;
						else
							row1 <= 0;
					end
			end
			
end

endmodule
