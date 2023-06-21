`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:36 05/15/2023 
// Design Name: 
// Module Name:    segment_display 
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
// see if we can remove and make it still work
module segment_display(input fast_hertz, input blink_hertz, input sel, input adj,
	input [6:0] tenth_min_cath, input [6:0] ones_min_cath, input [6:0] tenth_sec_cath, input [6:0] ones_sec_cath,
	output [3:0] anode_out, output [6:0] cathode_out);

	reg [1:0] which_digit = 2'b0;
	reg [3:0] anode_ref;
	reg [6:0] cathode_ref;
	
	/*
	always @ (*) begin
		anode_ref = 4'b0111;
		cathode_ref = 7'b1111111;
	end
	*/
	
	always @ (posedge fast_hertz) begin
		if (which_digit == 2'b00) begin
			if (!adj) begin
				cathode_ref = tenth_min_cath;
			end else begin
				if(!sel) begin
					if (blink_hertz) begin
						cathode_ref = 7'b1111111;
					end else begin
						cathode_ref = tenth_min_cath;
					end
				end
			end
			anode_ref = 4'b0111;
			which_digit <= which_digit + 2'b01;
		end else if (which_digit == 2'b01) begin
			if (!adj) begin
				cathode_ref = ones_min_cath;
			end else begin
				if(!sel) begin
					if (blink_hertz) begin
						cathode_ref = 7'b1111111;
					end else begin
						cathode_ref = ones_min_cath;
					end
				end
			end
			anode_ref = 4'b1011;
			which_digit <= which_digit + 2'b01;
		end else if (which_digit == 2'b10) begin
			if (!adj) begin
				cathode_ref = tenth_sec_cath;
			end else begin
				if(sel) begin
					if (blink_hertz) begin
						cathode_ref = 7'b1111111;
					end else begin
						cathode_ref = tenth_sec_cath;
					end
				end
			end
			anode_ref = 4'b1101;
			which_digit <= which_digit + 2'b01;
		end else if (which_digit == 2'b11) begin
			if (!adj) begin
				cathode_ref = ones_sec_cath;
			end else begin
				if(sel) begin
					if (blink_hertz) begin
						cathode_ref = 7'b1111111;
					end else begin
						cathode_ref = ones_sec_cath;
					end
				end
			end
			anode_ref = 4'b1110;
			which_digit <= 2'b00;
		end
	end
	
	
	assign anode_out = anode_ref;
	assign cathode_out = cathode_ref;
	
endmodule
