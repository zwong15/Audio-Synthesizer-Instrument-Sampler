module  keyboard ( input logic
									  Clk,                // 50 MHz clock
                             Reset,              // Active-high reset signal
                             frame_clk,          
					input logic [3:0]  highlighter_, highlighter_1, highlighter_2, highlighter_3,
               input logic [9:0]  DrawX, DrawY,       // Current pixel coordinates
               output logic [3:0] is_rec
              );
				  
    logic [9:0] X_Coor, Y_Coor;
    assign X_Coor = DrawX;
    assign Y_Coor = DrawY;
	 
    always_comb 
	 begin
		  
		  /*Non-Highlight Keys*/
				
        if ( (highlighter_ != 4'd2 && highlighter_1 != 4'd2 && highlighter_2 != 4'd2 && highlighter_3 != 4'd2) && (X_Coor >= 10'd59 && X_Coor < 10'd103) && (Y_Coor >= 10'd180 && Y_Coor < 10'd398))
		  begin
            is_rec = 4'd2;
		  end
			
		  else if ( (highlighter_ != 4'd4 && highlighter_1 != 4'd4 && highlighter_2 != 4'd4 && highlighter_3 != 4'd4) && (X_Coor >= 10'd163 && X_Coor < 10'd207) && (Y_Coor >= 10'd180 && Y_Coor < 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (highlighter_ != 4'd5 && highlighter_1 != 4'd5 && highlighter_2 != 4'd5 && highlighter_3 != 4'd5) && (X_Coor >= 10'd208 && X_Coor < 10'd267) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd6 && highlighter_1 != 4'd6 && highlighter_2 != 4'd6 && highlighter_3 != 4'd6) && (X_Coor >= 10'd268 && X_Coor < 10'd327) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd7 && highlighter_1 != 4'd7 && highlighter_2 != 4'd7 && highlighter_3 != 4'd7) && (X_Coor >= 10'd327 && X_Coor < 10'd371) && (Y_Coor >= 10'd180 && Y_Coor < 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (highlighter_ != 4'd8 && highlighter_1 != 4'd8 && highlighter_2 != 4'd8 && highlighter_3 != 4'd8) && (X_Coor >= 10'd372 && X_Coor < 10'd431) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if (  (highlighter_ != 4'd9 && highlighter_1 != 4'd9 && highlighter_2 != 4'd9 && highlighter_3 != 4'd9) && (X_Coor >= 10'd431 && X_Coor < 10'd475) && (Y_Coor >= 10'd180 && Y_Coor < 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (highlighter_ != 4'd10 && highlighter_1 != 4'd10 && highlighter_2 != 4'd10 && highlighter_3 != 4'd10) && (X_Coor >= 10'd476 && X_Coor < 10'd535) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd11 && highlighter_1 != 4'd11 && highlighter_2 != 4'd11 && highlighter_3 != 4'd11) && (X_Coor >= 10'd535 && X_Coor < 10'd579) && (Y_Coor >= 10'd180 && Y_Coor < 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (highlighter_ != 4'd12 && highlighter_1 != 4'd12 && highlighter_2 != 4'd12 && highlighter_3 != 4'd12) && (X_Coor >= 10'd580 && X_Coor < 10'd639) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  /* Middle Line Splitting the Double White Keys*/
		  else if ( (X_Coor == 10'd267) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Creating Outline when highlighting */
		  
		  /*Key 2*/
		  else if ( (X_Coor == 10'd59) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd103) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd59 && X_Coor <= 10'd103) && (Y_Coor == 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd59 && X_Coor <= 10'd103) && (Y_Coor == 10'd180) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Key 4*/
		  else if ( (X_Coor == 10'd163) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd207) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd163 && X_Coor <= 10'd207) && (Y_Coor == 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd163 && X_Coor <= 10'd207) && (Y_Coor == 10'd180) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Key 7*/
		  else if ( (X_Coor == 10'd327) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd371) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd327 && X_Coor <= 10'd371) && (Y_Coor == 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd327 && X_Coor <= 10'd371) && (Y_Coor == 10'd180) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Key 9*/
		  else if ( (X_Coor == 10'd431) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd475) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd431 && X_Coor <= 10'd475) && (Y_Coor == 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd431 && X_Coor <= 10'd475) && (Y_Coor == 10'd180) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Key 11*/
		  else if ( (X_Coor == 10'd535) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd579) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd535 && X_Coor <= 10'd579) && (Y_Coor == 10'd398) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor >= 10'd535 && X_Coor <= 10'd579) && (Y_Coor == 10'd180) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Creating the half black line split for black keys*/
		  else if ( (X_Coor == 10'd81) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd185) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd349) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd453) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  else if ( (X_Coor == 10'd557) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd2;
		  end
		  
		  /*Fill in Extra White*/
		  
		  else if ( (highlighter_ != 4'd1 && highlighter_1 != 4'd1 && highlighter_2 != 4'd1 && highlighter_3 != 4'd1) && (X_Coor >= 10'd59 && X_Coor <= 10'd81) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd3 && highlighter_1 != 4'd3 && highlighter_2 != 4'd3 && highlighter_3 != 4'd3) && (X_Coor > 10'd81 && X_Coor <= 10'd103) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd3 && highlighter_1 != 4'd3 && highlighter_2 != 4'd3 && highlighter_3 != 4'd3) && (X_Coor >= 10'd163 && X_Coor < 10'd185) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd5 && highlighter_1 != 4'd5 && highlighter_2 != 4'd5 && highlighter_3 != 4'd5) && (X_Coor > 10'd185 && X_Coor <= 10'd207) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd6 && highlighter_1 != 4'd6 && highlighter_2 != 4'd6 && highlighter_3 != 4'd6) && (X_Coor >= 10'd327 && X_Coor < 10'd349) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd8 && highlighter_1 != 4'd8 && highlighter_2 != 4'd8 && highlighter_3 != 4'd8) && (X_Coor > 10'd349 && X_Coor <= 10'd371) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd8 && highlighter_1 != 4'd8 && highlighter_2 != 4'd8 && highlighter_3 != 4'd8) && (X_Coor >= 10'd431 && X_Coor < 10'd453) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd10 && highlighter_1 != 4'd10 && highlighter_2 != 4'd10 && highlighter_3 != 4'd10) && (X_Coor > 10'd453 && X_Coor <= 10'd475) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd10 && highlighter_1 != 4'd10 && highlighter_2 != 4'd10 && highlighter_3 != 4'd10) && (X_Coor >= 10'd535 && X_Coor < 10'd557) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  else if ( (highlighter_ != 4'd12 && highlighter_1 != 4'd12 && highlighter_2 != 4'd12 && highlighter_3 != 4'd12) && (X_Coor > 10'd557 && X_Coor <= 10'd579) && (Y_Coor >= 10'd398 && Y_Coor <= 10'd479) )
		  begin
            is_rec = 4'd1;
		  end
		  
		  /*Highlighting Keys*/
		  
		  /*Key 1*/
		  else if( (highlighter_ == 4'd1 || highlighter_1 == 4'd1 || highlighter_2 == 4'd1 || highlighter_3 == 4'd1) && ((X_Coor >= 10'd0 && X_Coor < 10'd81) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479)) )
		  begin
				is_rec = 4'd3;
		  end
		  
		  else if( (highlighter_ != 4'd1 && highlighter_1 != 4'd1 && highlighter_2 != 4'd1 && highlighter_3 != 4'd1) && (X_Coor >= 10'd0 && X_Coor < 10'd59) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479) )
		  begin
				is_rec = 4'd1;
		  end
		  
		  /*Key 2*/
		  else if( (highlighter_ == 4'd2 || highlighter_1 == 4'd2 || highlighter_2 == 4'd2 || highlighter_3 == 4'd2) && ((X_Coor > 10'd59 && X_Coor < 10'd103) && (Y_Coor > 10'd180 && Y_Coor < 10'd398)) )
		  begin
				is_rec = 4'd4;
		  end
		  
		  /*Key 3*/
		  else if( (highlighter_ == 4'd3 || highlighter_1 == 4'd3 || highlighter_2 == 4'd3 || highlighter_3 == 4'd3) && ((X_Coor >= 10'd81 && X_Coor < 10'd185) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479))  )
		  begin
				is_rec = 4'd5;
		  end
		  
		  else if( (highlighter_ != 4'd3 && highlighter_1 != 4'd3 && highlighter_2 != 4'd3 && highlighter_3 != 4'd3) && (X_Coor >= 10'd81 && X_Coor < 10'd163) && (Y_Coor >= 10'd180 && Y_Coor <= 10'd479)  )
		  begin
				is_rec = 4'd1;
		  end
		  
		  /*Key 4*/
		  else if ( (highlighter_ == 4'd4 || highlighter_1 == 4'd4 || highlighter_2 == 4'd4 || highlighter_3 == 4'd4) && ((X_Coor > 10'd163 && X_Coor < 10'd207) && (Y_Coor > 10'd180 && Y_Coor < 10'd398)) )
		  begin
            is_rec = 4'd6;
		  end
		  
		  /*Key 5*/
		  else if( (highlighter_ == 4'd5 || highlighter_1 == 4'd5 || highlighter_2 == 4'd5 || highlighter_3 == 4'd5) && ((X_Coor >= 10'd185 && X_Coor < 10'd267) && (Y_Coor >= 10'd180 && Y_Coor < 10'd479))  )
		  begin
				is_rec = 4'd7;
		  end
		  
		  /*Key 6*/
		  else if( (highlighter_ == 4'd6 || highlighter_1 == 4'd6 || highlighter_2 == 4'd6 || highlighter_3 == 4'd6) && ((X_Coor >= 10'd268 && X_Coor < 10'd349) && (Y_Coor >= 10'd180 && Y_Coor < 10'd479))  )
		  begin
				is_rec = 4'd8;
		  end
		  
		  /*Key 7*/
		  else if( (highlighter_ == 4'd7 || highlighter_1 == 4'd7 || highlighter_2 == 4'd7 || highlighter_3 == 4'd7) && ((X_Coor > 10'd327 && X_Coor < 10'd371) && (Y_Coor > 10'd180 && Y_Coor < 10'd398))  )
		  begin
				is_rec = 4'd9;
		  end
		  
		  /*Key 8*/
		  else if( (highlighter_ == 4'd8 || highlighter_1 == 4'd8 || highlighter_2 == 4'd8 || highlighter_3 == 4'd8) && ((X_Coor >= 10'd349 && X_Coor < 10'd453) && (Y_Coor >= 10'd180 && Y_Coor < 10'd479))  )
		  begin
				is_rec = 4'd10;
		  end
		  
		  /*Key 9*/
		  else if( (highlighter_ == 4'd9 || highlighter_1 == 4'd9 || highlighter_2 == 4'd9 || highlighter_3 == 4'd9) && ((X_Coor > 10'd431 && X_Coor < 10'd475) && (Y_Coor > 10'd180 && Y_Coor < 10'd398))  )
		  begin
				is_rec = 4'd11;
		  end
		  
		  /*Key 10*/
		  else if( (highlighter_ == 4'd10 || highlighter_1 == 4'd10 || highlighter_2 == 4'd10 || highlighter_3 == 4'd10) && ((X_Coor >= 10'd453 && X_Coor < 10'd557) && (Y_Coor >= 10'd180 && Y_Coor < 10'd479))  )
		  begin
				is_rec = 4'd12;
		  end
		  
		  /*Key 11*/
		  else if( (highlighter_ == 4'd11 || highlighter_1 == 4'd11 || highlighter_2 == 4'd11 || highlighter_3 == 4'd11) && ((X_Coor > 10'd535 && X_Coor < 10'd579) && (Y_Coor > 10'd180 && Y_Coor < 10'd398))  )
		  begin
				is_rec = 4'd13;
		  end
		  
		  /*Key 12*/
		  else if( (highlighter_ == 4'd12 || highlighter_1 == 4'd12 || highlighter_2 == 4'd12 || highlighter_3 == 4'd12) && ((X_Coor >= 10'd557 && X_Coor < 10'd639) && (Y_Coor >= 10'd180 && Y_Coor < 10'd479))  )
		  begin
				is_rec = 4'd14;
		  end
		  
		  else
				
				is_rec = 4'd0;
		  
    end
    
endmodule
