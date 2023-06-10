`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:22 04/24/2023 
// Design Name: 
// Module Name:    convert2sign 
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
module convert2sign(input [11:0] d, output [0:0] s, output [11:0] r);
	 
	 reg [11:0] r_hold;
	 assign s = d[11];
	 
	 
	 always @(*)
		if (s == 1'b0)
			begin
				r_hold = d;
			end
		else 
			begin
				r_hold = 1'b1 + ~d;
				if (r_hold == 12'b100000000000)
					begin
						r_hold = r_hold - 1'b1;
					end
			end
		
		assign r = r_hold;

endmodule
