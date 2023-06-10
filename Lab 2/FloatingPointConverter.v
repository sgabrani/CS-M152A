`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:01 04/26/2023 
// Design Name: 
// Module Name:    FloatingPointConverter 
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
module FloatingPointConverter(input [11:0] d, output [0:0] s, output [2:0] e, output [3:0] f
    );
	
	wire [11:0] r;
	wire [2:0] trans_e;
	wire [3:0] trans_s;
	wire [0:0] trans_f;
	
	convert2sign block_1(
		.d(d),
		.s(s),
		.r(r)
	);
	
	linearToFB block_2(
		.r(r),
		.e(trans_e),
		.s(trans_s),
		.f(trans_f)
	);
	
	rounding block_3(
		.e(trans_e),
		.s(trans_s),
		.f(trans_f),
		.outputE(e),
		.outputS(f)
	);
	

endmodule
