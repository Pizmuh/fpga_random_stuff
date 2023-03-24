module beeb
(
	input clk,
	output speaker
);

	reg [15:0] counter;
	always @(posedge clk) counter <= counter+1;
	assign speaker = counter[15];

endmodule
