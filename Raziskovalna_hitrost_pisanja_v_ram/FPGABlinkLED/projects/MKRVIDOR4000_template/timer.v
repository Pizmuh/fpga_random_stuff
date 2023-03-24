`timescale 1ns / 1ps
module timer(
  output clock,
  inout inp1,
  inout inp2,
  output y1,
  output y2
);





assign y1 = inp1 == 1 ? 0:1;
assign y2 = inp2 == 1 ? 0:1;
assign clock = y1;

/// Slikica na zaslonu v bistvu ozadje





endmodule
