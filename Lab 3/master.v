`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:53 05/15/2023 
// Design Name: 
// Module Name:    master 
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
module master(input sel, input adj, input reset, input pause, input clock,
	output [3:0] anode_out, output [7:0] cathode_out);
	
	/*
	input sel;
	input adj;
	input rst;
	input pause;
	input clk;
	output [3:0] anode_vec;
	output [6:0] cathode_vec;
	*/

	wire sel_deb;
	wire adj_deb;
	wire reset_deb;
	wire pause_deb;
	
	wire one_hertz;
	wire two_hertz;
	wire fast_hertz;
	wire blink_hertz;
	
	//Debounce inputs (Buttons: pause, reset, Switches: select, adjust)
	debouncer sel_db_func(.clock(clock), .button(sel), .bounce(sel_deb));
	debouncer adj_db_func(.clock(clock), .button(adj), .bounce(adj_deb));
	debouncer reset_db_func(.clock(clock), .button(reset), .bounce(reset_deb));
	debouncer pause_db_func(.clock(clock), .button(pause), .bounce(pause_deb));
	
	//Divide clock into slower clocks to be passed to other modules
	clk_distributor clocks(.master_clk(clock), .reset(reset_deb), .one_hertz(one_hertz),
		.two_hertz(two_hertz), .fast_hertz(fast_hertz), .blink_hertz(blink_hertz));

	//Main counting logic
	wire [3:0] min_tenth;
	wire [3:0] min_ones;
	wire [3:0] sec_tenth;
	wire [3:0] sec_ones;
	
	wire [6:0] tenth_min_cath;
	wire [6:0] ones_min_cath;
	wire [6:0] tenth_sec_cath;
	wire [6:0] ones_sec_cath;

	counter counter(.one_hertz(one_hertz), .two_hertz(two_hertz), .sel(sel_deb), .adj(adj_deb), .reset(rest_deb), .pause(pause_deb),
		.min_tenth(min_tenth), .min_ones(min_ones), .sec_tenth(sec_tenth), .sec_ones(sec_ones));

	segment_display_distributor tenth_min_display(.digit(min_tenth), .cathode(tenth_min_cath));
	segment_display_distributor ones_min_display(.digit(min_ones), .cathode(ones_min_cath));
	segment_display_distributor tenth_sec_display(.digit(sec_tenth), .cathode(tenth_sec_cath));
	segment_display_distributor ones_sec_display(.digit(sec_ones), .cathode(ones_sec_cath));

	segment_display final_output(.fast_hertz(fast_hertz), .blink_hertz(blink_hertz), .sel(sel_deb),
		.adj(adj_deb), .tenth_min_cath(tenth_min_cath), .ones_min_cath(ones_min_cath),
		.tenth_sec_cath(tenth_sec_cath), .ones_sec_cath(ones_sec_cath), .anode_out(anode_out),
		.cathode_out(cathode_out));


endmodule
