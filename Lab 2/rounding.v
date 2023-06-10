`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:24 04/26/2023 
// Design Name: 
// Module Name:    rounding 
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
module rounding(input [2:0] e, input [3:0] s, input [0:0] f, output reg [2:0] outputE, output reg [3:0] outputS);
	always @(*)
	begin
		if (f == 1) begin
			if (s == 4'b1111) begin
				if (e == 3'b111) begin
					outputE = 3'b111;
					outputS = 4'b1111;
				end else begin 
					outputE = e + 1'b1;
					outputS = 4'b1000;
				end
			end else begin
				outputS = s + 1'b1;
				outputE = e;
			end
		end
		else begin
			outputE = e;
			outputS = s;
		end
	end
	


endmodule
