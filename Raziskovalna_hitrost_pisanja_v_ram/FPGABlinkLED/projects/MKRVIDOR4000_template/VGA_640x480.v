`timescale 1ns / 1ps
module VGA_640x480(
  input clock,
  output reg [0:0 ] red_F, 
  output reg [0:0 ] green_F, 
  output reg [0:0 ] blue_F,
  output reg hsync, 
  output reg vsync

);




reg [9:0] hcount = 0;
reg [9:0] vcount = 0;
reg [1:0] counter = 0;

reg enable;

// sinhronizacija VGA zaslona
always @ (posedge clock)
begin
  if (counter == 3)
  begin
    counter <= 1'b0;
    enable <= 1'b1;
  end
  else
  begin
    counter <= counter + 1'b1;
    enable <= 1'b0;
  end
end

always @(posedge clock)
begin
  if (enable == 1)
  begin
    if(hcount == 799)
    begin
      hcount <= 0;
      if(vcount == 524)
        vcount <= 0;
      else 
        vcount <= vcount+1'b1;
    end
    else
      hcount <= hcount+1'b1;

  if (vcount >= 490 && vcount < 492) 
    vsync <= 1'b0;
  else
    vsync <= 1'b1;

  if (hcount >= 656 && hcount < 752) 
    hsync <= 1'b0;
  else
    hsync <= 1'b1;
  end
end


//Testni prikaz kocke 


always @ (posedge clock)
begin
 if (enable)begin
	if (hcount > 200 && hcount < 635 && vcount > 200 && vcount < 475) begin
	   green_F <= 1'b1;
      blue_F  <= 1'b1; 
      red_F   <= 1'b1;
	 end 
	 else begin
	   green_F <= 1'b0;
      blue_F <= 1'b0; 
      red_F <= 1'b0;
	 end
	end
end 
	

	
endmodule

