`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:19 05/10/2023
// Design Name:   clk_distributor
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab3/Lab3/clk_distributor_TB.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_distributor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_distributor_TB;

	// Inputs
	reg master_clk;
	reg reset;

	// Outputs
	wire one_hertz;
	wire two_hertz;
	wire fast_hertz;
	wire blink_hertz;

	// Instantiate the Unit Under Test (UUT)
	clk_distributor uut (
		.master_clk(master_clk), 
		.reset(reset), 
		.one_hertz(one_hertz), 
		.two_hertz(two_hertz), 
		.fast_hertz(fast_hertz), 
		.blink_hertz(blink_hertz)
	);

	initial begin
		
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		reset = 0; 
		master_clk = 0;

	end
	always begin
		#5 master_clk = ~master_clk;
	end

endmodule

