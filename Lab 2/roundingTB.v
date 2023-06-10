`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:45 04/26/2023
// Design Name:   rounding
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab2/Lab2/roundingTB.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rounding
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module roundingTB;

	// Inputs
	reg [2:0] e;
	reg [3:0] s;
	reg [0:0] f;

	// Outputs
	wire [2:0] outputE;
	wire [3:0] outputS;

	// Instantiate the Unit Under Test (UUT)
	rounding uut (
		.e(e), 
		.s(s), 
		.f(f), 
		.outputE(outputE), 
		.outputS(outputS)
	);

	initial begin
		// Initialize Inputs
		e = 3'b010;
		s = 4'b1011;
		f = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

