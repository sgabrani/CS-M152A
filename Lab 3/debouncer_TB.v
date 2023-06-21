`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:13:52 05/10/2023
// Design Name:   debouncer
// Module Name:   C:/Users/Student/Documents/Group8_Lab1/Lab3/Lab3/debouncer_TB.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
// testbench verilog code for debouncing button without creating another clock
module debouncer_TB;
 // Inputs
 reg pb_1;
 reg clk;
 // Outputs
 wire pb_out;
 // Instantiate the debouncing Verilog code
 debouncer uut (
  .pb_1(pb_1), 
  .clk(clk), 
  .pb_out(pb_out)
 );
 initial begin
  clk = 0;
  forever #10 clk = ~clk;
 end
 initial begin
  pb_1 = 0;
  #10;
  pb_1=1;
  #20;
  pb_1 = 0;
  #10;
  pb_1=1;
  #30; 
  pb_1 = 0;
  #10;
  pb_1=1;
  #40;
  pb_1 = 0;
  #10;
  pb_1=1;
  #30; 
  pb_1 = 0;
  #10;
  pb_1=1; 
  #1000; 
  pb_1 = 0;
  #10;
  pb_1=1;
  #20;
  pb_1 = 0;
  #10;
  pb_1=1;
  #30; 
  pb_1 = 0;
  #10;
  pb_1=1;
  #40;
  pb_1 = 0; 
 end 
      
endmodule

