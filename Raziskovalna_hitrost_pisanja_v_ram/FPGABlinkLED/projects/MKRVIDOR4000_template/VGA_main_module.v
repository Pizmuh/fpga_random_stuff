`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:36 09/02/2017 
// Design Name: 
// Module Name:    VGA_driver 
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
module VGA_driver(
	input wire clk,			//master clock = 100MHz
	input wire clr,			//right-most pushbutton for reset
	// output wire [6:0] seg,	//7-segment display LEDs
	// output wire [2:0] an,	//7-segment display anode enable
	// output wire dp			//7-segment display decimal point
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,   //green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync		//vertical sync out
	);



// VGA display clock interconnect
 wire dclk;


// generate 7-segment clock & display clock
clockdiv U1(
	.clk(clk),
	//.clr(clr),
	// .segclk(segclk)
	.dclk(dclk)
	);



// VGA controller
VGA U3(
	.dclk(dclk),
	.clr(clr),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)
	);

endmodule

