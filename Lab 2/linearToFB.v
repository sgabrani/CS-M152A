`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:30 04/26/2023 
// Design Name: 
// Module Name:    linearToFB 
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
module linearToFB (input [11:0] r, output reg [2:0] e, output reg [3:0] s, output reg f);
	// reg [11:0] r_temp;
	always @(*)
	begin
		//r_temp = r;
		if (r[11] == 1) begin
			e = 3'b111;
			s = 4'b1111;
			f = 1'b1;
		end else if (r[10] == 1) begin 
			e = 3'b111;
			s = r[10:7];
			f = r[6];
		end else if (r[9] == 1) begin 
			e = 3'b110;
			s = r[9:6];
			f = r[5];
		end else if (r[8] == 1) begin 
			e = 3'b101;
			s = r[8:5];
			f = r[4];
		end else if (r[7] == 1) begin 
			e = 3'b100;
			s = r[7:4];
			f = r[3];
		end else if (r[6] == 1) begin 
			e = 3'b011;
			s = r[6:3];
			f = r[2];
		end else if (r[5] == 1) begin 
			e = 3'b010;
			s = r[5:2];
			f = r[1];
		end else if (r[4] == 1) begin 
			e = 3'b001;
			s = r[4:1];
			f = r[0];
		end else begin
			e = 3'b000;
			s = r[3:0];
			f = 1'b0;
		end
	end

endmodule
