module note_A
(
	input clk,
	output speaker
);
	reg[15:0] counter;
	always @(posedge clk) if(counter==56817) counter <= 0; else counter <=counter+1;
	assign speaker = counter[15];
endmodule
