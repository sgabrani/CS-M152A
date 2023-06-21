`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:17 05/15/2023 
// Design Name: 
// Module Name:    segment_display_distributor 
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
module segment_display_distributor(input [3:0] digit, output [6:0] cathode);
	
	reg [6:0] cathode_ref;
	
	always @ (*) begin
		if (digit == 4'b0000) begin
			cathode_ref = 7'b1000000;
		end else if (digit == 4'b0001) begin
			cathode_ref = 7'b1111001;
		end else if (digit == 4'b0010) begin
			cathode_ref = 7'b0100100;
		end else if (digit == 4'b0011) begin
			cathode_ref = 7'b0110000;
		end else if (digit == 4'b0100) begin
			cathode_ref = 7'b0011001;
		end else if (digit == 4'b0101) begin
			cathode_ref = 7'b0010010;
		end else if (digit == 4'b0110) begin
			cathode_ref = 7'b0000010;
		end else if (digit == 4'b0111) begin
			cathode_ref = 7'b1111000;
		end else if (digit == 4'b1000) begin
			cathode_ref = 7'b0000000;
		end else if (digit == 4'b1001) begin
			cathode_ref = 7'b0010000;
		end else begin
			cathode_ref = 7'b1111111;
		end
	end
	
	assign cathode = cathode_ref;

endmodule
