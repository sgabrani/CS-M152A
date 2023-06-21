`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:46:30 05/10/2023 
// Design Name: 
// Module Name:    counter 
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
module counter(input one_hertz, input two_hertz, input sel, input adj, input reset,
	input pause, output [3:0] min_tenth, output [3:0] min_ones, output [3:0] sec_tenth,
	output [3:0] sec_ones);
	
	reg [5:0] minutes = 6'b000000;
	reg [5:0] seconds = 6'b000000;
	reg clock;
	reg pause_tmp = 1'b0;

	always @ (*) begin
		if (adj) begin
			clock = two_hertz;
		end else begin
			clock = one_hertz;
		end
	end
	
	always @ (posedge pause) begin
		pause_tmp = ~pause_tmp;
	end
	
	always @ (posedge clock) begin
		minutes <= 10 * min_tenth + min_ones;
		seconds <= 10 * sec_tenth + sec_ones;
		if (reset) begin
			minutes <= 0;
			seconds <= 0;
		end else begin
			if (~pause_tmp) begin
				//normal stopwatch mode 
				if (~adj) begin
					if (minutes != 59 && seconds != 59) begin
						seconds <= seconds + 6'b1;
					end else if (minutes != 59 && seconds == 59) begin
						seconds <= 6'b0;
						minutes <= minutes + 6'b1;
					end else begin
						minutes <= 6'b0;
						seconds <= 6'b0;
					end
				//if we are adjusting 
				end else begin
					if (sel) begin
						if (seconds != 59) begin
							seconds <= seconds + 6'b1;
						end else begin
							seconds <= 6'b0;
						end
					end else begin
						if (minutes != 59) begin
							minutes <= minutes + 6'b1;
						end else begin
							minutes <= 6'b0;
						end
					end
				end
			end
		end
	end
	
	assign min_tenth = minutes / 10;
	assign min_ones = minutes - (min_tenth * 10);
	assign sec_tenth = seconds / 10;
	assign sec_ones = seconds - (sec_tenth * 10);

endmodule
