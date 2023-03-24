//Mali jelenček rudolf
module music_ROM_tetris(
	input clk,
	input [7:0] address,
	output reg [7:0] note
);

always @(posedge clk)

//Mali jelenček rudolf
case(address)
	  0: note<= 8'd25;
	  1: note<= 8'd25;
	  2: note<= 8'd25;
	  3: note<= 8'd25;
	  4: note<= 8'd25;
	  5: note<= 8'd25;
	  6: note<= 8'd25;
	  7: note<= 8'd25;
	  8: note<= 8'd25;
	  9: note<= 8'd25;
	default: note <= 8'd0;
endcase
endmodule

//////////////////////////////