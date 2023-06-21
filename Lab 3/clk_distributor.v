`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:55 05/10/2023 
// Design Name: 
// Module Name:    clk_distributor 
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
module clk_distributor(input master_clk, input reset, output wire one_hertz,
	output wire two_hertz, output wire fast_hertz, output wire blink_hertz
    );
	
	// Keep active track of the master clock cycle for the various clocks
	reg [31:0] one_cnt;
	reg [31:0] two_cnt;
	reg [31:0] fast_cnt; //500 hz
	reg [31:0] blink_cnt; //5 hz
	
	reg one_ref;
	reg two_ref;
	reg fast_ref;
	reg blink_ref;
	
	always @ (posedge master_clk or posedge reset) begin
		if (reset) begin
			one_cnt <= 32'b0;
			two_cnt <= 32'b0;
			fast_cnt <= 32'b0;
			blink_cnt <= 32'b0;
			one_ref <= 0;
			two_ref <= 0;
			fast_ref <= 0;
			blink_ref <= 0;
		end else begin
			one_cnt <= one_cnt + 32'b1;
			two_cnt <= two_cnt + 32'b1;
			fast_cnt <= fast_cnt + 32'b1;
			blink_cnt <= blink_cnt + 32'b1;
			if (one_cnt == 32'd50000000 - 32'b1) begin
				one_cnt <= 32'b0;
				one_ref <= ~one_hertz;
			end else begin
				one_ref <= one_hertz;
			end if (two_cnt == 32'd25000000 - 32'b1) begin
				two_cnt <= 32'b0;
				two_ref <= ~two_hertz;
			end else begin
				two_ref <= two_hertz;
			end if (fast_cnt == 32'd100000 - 32'b1) begin
				fast_cnt <= 32'b0;
				fast_ref <= ~fast_hertz;
			end else begin
				fast_ref <= fast_hertz;
			end if (blink_cnt == 32'd20000000 - 32'b1) begin
				blink_cnt <= 32'b0;
				blink_ref <= ~blink_hertz;
			end else begin
				blink_ref <= blink_hertz;
			end 
		end
	end
	
	assign one_hertz = one_ref;
	assign two_hertz = two_ref;
	assign fast_hertz = fast_ref;
	assign blink_hertz = blink_ref;
	
endmodule
