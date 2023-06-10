`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:41:14 04/26/2023
// Design Name:   linearToFB
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab2/Lab2/linearToFBTB.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: linearToFB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module linearToFBTB;

	// Inputs
	reg [11:0] r;

	// Outputs
	wire [2:0] e;
	wire [3:0] s;
	wire [0:0] f;


	// Instantiate the Unit Under Test (UUT)
	linearToFB uut (
		.r(r),
		.e(e),
		.s(s),
		.f(f)
	);

	initial begin
		// Initialize Inputs
		r = 12'b000000101100;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$finish;
	end
      
endmodule

