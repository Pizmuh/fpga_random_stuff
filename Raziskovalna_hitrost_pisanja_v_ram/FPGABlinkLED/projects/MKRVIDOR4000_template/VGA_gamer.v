`timescale 1ns / 1ps
module VGA_gamer(
  input clock,
  output reg [2:0 ] red, 
  output reg [2:0 ] green, 
  output reg [1:0 ] blue,
  output reg hsync, 
  output reg vsync,
  input inp1,
  input inp2
);


reg [9:0] hcount = 0;
reg [9:0] vcount = 0;
reg [1:0] counter = 0;
reg enable;

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







/// Slikica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
  if (enable)
  begin
    
    if ( (50 < hcount && hcount < 55 &&  vcount > 10 && vcount < 86 ) || (50 < hcount && hcount < 55 &&  vcount > 106 && vcount < 182) || (50 < hcount && hcount < 55 &&  vcount > 202 && vcount < 278)  || (50 < hcount && hcount < 55 &&  vcount > 298 && vcount < 374)|| (50 < hcount && hcount < 55 &&  vcount > 394 && vcount < 470)) //Leva meja 
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (600 < hcount && hcount < 605 &&  vcount > 10 && vcount < 86 ) || (600 < hcount && hcount < 605 &&  vcount > 106 && vcount < 182) || (600 < hcount && hcount < 605 &&  vcount > 202 && vcount < 278)  || (600 < hcount && hcount < 605 &&  vcount > 298 && vcount < 374)|| (600 < hcount && hcount < 605 &&  vcount > 394 && vcount < 470)) //Desna meja
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (countx < hcount && hcount < countx + 10 &&  vcount > county && vcount < county+10 ) ) //Žogica
    begin
	 
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (countx < hcount && hcount < countx + 10 &&  vcount > 100 && vcount < 200 ) ) //Kvadratek
    begin
	 
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( hcount == vcount) 
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else 
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
    end
  end 
end 


reg [25:0] accumx = 0;
reg [25:0] accumy = 0;
reg [8:0] countx = 0;
reg [8:0] county = 0;

wire ppsx = (accumx == 0);
wire ppsy = (accumy == 0);

reg prev_inp1 = 0;
reg prev_inp2 = 0;

always @(posedge clock) begin
    accumx <= (ppsx ? 5_000_000 : accumx) - 1;
	 accumy <= (ppsy ? 5_000_000 : accumy) - 1;

    if (ppsx) begin
		countx = countx+1;
	end
	if (ppsy) begin
		county = county+1;
        //… things to do once per second /10 …
    end
	 if  (prev_inp1 != inp1)
		begin
			if (inp1 == 1)
				begin
					countx = countx + 10;
					prev_inp1 <= inp1;
				end
			else
				begin
					prev_inp1 <= inp1;
				end
	end
	if  (prev_inp2 != inp2)
		begin
			if (inp2 == 1)
				begin
					countx = countx - 10;
					prev_inp2 <= inp2;
				end
			else
				begin
					prev_inp2 <= inp2;
				end
	end
end



	

endmodule
