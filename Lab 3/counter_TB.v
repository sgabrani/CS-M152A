`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:37 05/15/2023
// Design Name:   counter
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab3/Lab3/counter_TB.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_TB;

	// Inputs
	reg one_hertz;
	reg two_hertz;
	reg sel;
	reg adj;
	reg reset;
	reg pause;

	// Outputs

	wire [3:0] min_tenth;
	wire [3:0] min_ones;
	wire [3:0] sec_tenth;
	wire [3:0] sec_ones;


	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.one_hertz(one_hertz), 
		.two_hertz(two_hertz), 
		.sel(sel), 
		.adj(adj), 
		.reset(reset), 
		.pause(pause), 
		.min_tenth(min_tenth), 
		.min_ones(min_ones), 
		.sec_tenth(sec_tenth), 
		.sec_ones(sec_ones)
	);

	initial begin
		// Initialize Inputs
		one_hertz = 0;
		two_hertz = 0;
		sel = 0;
		adj = 0;
		reset = 0;
		pause = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always begin
		#10 one_hertz = ~one_hertz;
	end
      
endmodule

