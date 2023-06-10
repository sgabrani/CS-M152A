`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:14:58 04/26/2023
// Design Name:   convert2sign
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab2/Lab2/convert2signTB.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: convert2sign
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module convert2signTB;

	// Inputs
	reg [11:0] d;

	// Outputs
	wire [0:0] s;
	wire [11:0] r;

	// Instantiate the Unit Under Test (UUT)
	convert2sign uut (
		.d(d), 
		.s(s), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		d = 12'b000000101100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$finish;

	end
      
endmodule

