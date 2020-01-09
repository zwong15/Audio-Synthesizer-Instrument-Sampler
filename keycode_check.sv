/*module keycode_check(

input logic Clk, Reset,
input logic [31:0] keycode,
output logic [31:0] keycode_adjusted

);


enum logic [3:0] {
KEYCODE_ZERO,
KEYCODE_1,
KEYCODE_1_CHECK,
KEYCODE_2,
KEYCODE_2_CHECK,
KEYCODE_3,
KEYCODE_3_CHECK,
KEYCODE_4,
KEYCODE_4_CHECK

}   curr_state, next_state;

always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= KEYCODE_ZERO;
				
        else 
            curr_state <= next_state;
    end
	 

always_comb
    begin  
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state)	 
				
				KEYCODE_ZERO:
					if(keycode[7:0] != 8'b0)
						next_state = KEYCODE_1;
						
				KEYCODE_1:
					next_state = KEYCODE_1_CHECK;
					
				KEYCODE_1_CHECK:
				begin
					if(keycode[15:8] != 8'b0)
						next_state = KEYCODE_2;
						
					if(keycode == 32'b0)
						next_state = KEYCODE_ZERO;
				end
				
				KEYCODE_2:
					next_state = KEYCODE_2_CHECK;
					
				KEYCODE_2_CHECK:
				begin
					if(keycode[23:16] != 8'b0)
						next_state = KEYCODE_3;
						
					if(keycode == 32'b0)
						next_state = KEYCODE_ZERO;
				end
				
				KEYCODE_3:
					next_state = KEYCODE_3_CHECK;
					
				KEYCODE_3_CHECK:
				begin
					if(keycode[31:24] != 8'b0)
						next_state = KEYCODE_4;
						
					if(keycode == 32'b0)
						next_state = KEYCODE_ZERO;
				end
				
				KEYCODE_4:
					next_state = KEYCODE_4_CHECK;
					
				KEYCODE_4_CHECK:
					if(keycode == 32'b0)
						next_state = KEYCODE_ZERO;
				
				
						
			
			
		  endcase
		  
		  case (curr_state)
		  
		  endcase
end
endmodule*/
