`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:01 04/26/2023
// Design Name:   FloatingPointConverter
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab2/Lab2/FloatingPointConverterTB.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FloatingPointConverter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FloatingPointConverterTB;

	// Inputs
	reg [11:0] d;

	// Outputs
	wire [0:0] s;
	wire [2:0] e;
	wire [3:0] f;
	
	integer i;
	

	// Instantiate the Unit Under Test (UUT)
	
	FloatingPointConverter uut (
		.d(d),
		.s(s),
		.e(e),
		.f(f)
	);
	
	
	initial begin
		// Initialize Inputs
		
		for (i = 44; i <= 48; i = i + 1) begin
			d = i;
			#10;
			$display("%d, %b, %b, %b, %b", i, d, s, e, f);
		end
		
		
		#10000;

		// Add stimulus here
		$finish;

	end
      
endmodule

