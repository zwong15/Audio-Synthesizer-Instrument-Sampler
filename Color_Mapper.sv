//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input logic	[3:0]  is_rec,
							  input logic  [4:0]  sprite_on,
                       input logic  [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
	 logic [9:0] X_Coor, Y_Coor;
	 
	 // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 
	 logic [9:0] sprite_addr;
	 logic [63:0] sprite_data;
	 logic        is_sprite;
	 
	 font_rom font_rom_instance(.addr(sprite_addr), .data(sprite_data));
	 
	 always_comb
	 begin
			case(sprite_on)
				
				5'd1:
					sprite_addr = DrawY + 128*'d3;
					
				5'd2:
					sprite_addr = DrawY + 128*'d0;
					
				5'd3:
					sprite_addr = DrawY + 128*'d4;
				
				5'd4:
					sprite_addr = DrawY + 128*'d5;
				
				5'd5:
					sprite_addr = DrawY + 128*'d6;
				
				5'd6:
					sprite_addr = DrawY + 128*'d7;
				
				5'd7:
					sprite_addr = DrawY + 128*'d1;
				
				5'd8:
					sprite_addr = DrawY + 128*'d2;
				
				default:
					sprite_addr = 11'd0;
				
			endcase
	 end
	 
	 always_comb
	 begin
			case(sprite_on)
			
					5'd1:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin	
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
					
					5'd2:
						
						if( sprite_data[10'd7 - DrawX - 10'd64] == 1'b1 )
						begin
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
						
					5'd3:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin	
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
					
					5'd4:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
						
					5'd5:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin	
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
					
					5'd6:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
						
					5'd7:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin	
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
					
					5'd8:
						
						if( sprite_data[10'd7 - DrawX] == 1'b1 )
						begin
							is_sprite = 1'd1;
						end
						
						else
						begin
							is_sprite = 1'd0;
						end
					
					default:
						is_sprite = 5'd0;
	 
			endcase
	 
	 end
    
    // Assign color based on signals
    always_comb
    begin
			
        if ( (is_sprite == 1'd0) && (is_rec == 4'd1) ) 
        begin
            // White
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end
		  
		  else if ( (is_sprite == 1'd0) && (is_rec == 4'd2) )
		  begin
				// Black
				Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd3) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) ||  (is_rec == 4'd4) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd5) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd6) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd7) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd8) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd9) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd10) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd11) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd12) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd13) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else if ( (is_sprite == 1'd1) || (is_rec == 4'd14) )
		  begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
		  end
		  
		  else 
        begin
            // Background with nice color gradient
				Red = 8'h3f; 
            Green = 8'h00;
            Blue = 8'h7f - {1'b0, DrawX[9:3]};
        end
    end
    
endmodule
