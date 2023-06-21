`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:35 05/15/2023 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(input clock, input button, output bounce);
  
  reg bounce_temp;
  reg [15:0] counter;

  reg sync_1;
  reg sync_2;

  always @ (posedge clock) begin
    sync_1 <= button;
  end
  always @ (posedge clock) begin
    sync_2 <= sync_1;
  end


  always @ (posedge clock) begin
  	if (bounce_temp == sync_2) begin
		counter <= 0;
	end
	else begin
		counter <= counter + 1'b1;
		if (counter == 16'hffff) begin
	     		bounce_temp <= ~bounce;
		end
        end
  end
  assign bounce = bounce_temp;
endmodule 
