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
module  Sprite_Color_Mapper ( input logic	[3:0]  key_highlight,
							  input logic [1:0] function_mode,
                       input logic  [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [4:0] is_sprite
                     );

    
    // Assign color based on signals
    always_comb
	 begin
	 
	 if (function_mode == 2'd1 || function_mode == 2'd2 )
	 begin
		is_sprite = 5'd0;
	 end
	 
	 else
    begin
			case(key_highlight)
			
				4'd1:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd1;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
				
				4'd2:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd1;
					end
					
					else if ( (DrawX >= 10'd64 && DrawX < 10'd128) && (DrawY >= 10'd0 && DrawY < 10'd96) )
					begin
						is_sprite = 5'd2;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd3:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd3;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
				
				4'd4:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd3;
					end
					
					else if ( (DrawX >= 10'd64 && DrawX < 10'd128) && (DrawY >= 10'd0 && DrawY < 10'd96) )
					begin
						is_sprite = 5'd2;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd5:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd4;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd6:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd5;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd7:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd5;
					end
					
					else if ( (DrawX >= 10'd64 && DrawX < 10'd128) && (DrawY >= 10'd0 && DrawY < 10'd96) )
					begin
						is_sprite = 5'd2;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
				
				4'd8:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd6;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd9:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd6;
					end
					
					else if ( (DrawX >= 10'd64 && DrawX < 10'd128) && (DrawY >= 10'd0 && DrawY < 10'd96) )
					begin
						is_sprite = 5'd2;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd10:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd7;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				4'd11:
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd7;
					end
					
					else if ( (DrawX >= 10'd64 && DrawX < 10'd128) && (DrawY >= 10'd0 && DrawY < 10'd96) )
					begin
						is_sprite = 5'd2;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
				
				4'd12:
				
					if( (DrawX >= 10'd0 && DrawX < 10'd64) && (DrawY >= 10'd0 && DrawY < 10'd128) )
					begin
						is_sprite = 5'd8;
					end
					
					else
					begin
						is_sprite = 5'd0;
					end
					
				default:
				begin
					is_sprite = 5'd0;
				end
			
			endcase
			
		end
		
	 end
	 
    
endmodule
