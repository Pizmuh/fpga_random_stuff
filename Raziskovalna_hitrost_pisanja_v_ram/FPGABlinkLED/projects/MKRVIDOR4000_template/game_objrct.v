`timescale 1ns / 1ps
module game_objrct(
  input clock,
  output reg [2:0 ] red, 
  output reg [2:0 ] green, 
  output reg [1:0 ] blue,
  input reg hcount, 
  input reg vcount,
  input enable
   
);


always @ (posedge clock)
begin
  if (enable)
  begin
    if (hcount < 80 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if (hcount < 160 && vcount < 480) 
    begin
      green <= 3'b111;
      blue <= 2'b00; 
      red <= 3'b111;
    end
    else if (hcount < 40 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b000;
    end
    else if (hcount < 320 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b00; 
      red <= 3'b000;
    end
    else if (hcount < 400 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if (hcount < 480 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b111;
    end
    else if (hcount < 560 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b11; 
      red <= 3'b000;
    end
    else if (hcount < 640 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
    end
    else 
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
    end
  end 
end 
endmodule
