module incrementControl(

input logic Clk, Reset, new_note, count_done, sample_clk, init,
output logic Done, count_inc, increment

);


enum logic [2:0] {

WAIT_START,
NOTE_DONE,
WAIT_SCLK_HIGH,
INCREMENT,
COUNT_INCREMENT,
WAIT_SCLK_LOW,
CHECK_NOTE_DONE

}   curr_state, next_state;


	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= WAIT_START;
        else 
            curr_state <= next_state;
    end

	 
	 
always_comb
    begin
        
			next_state  = curr_state;	
			unique case (curr_state) 
					WAIT_START 			: if(init)
												next_state = NOTE_DONE;
										
					NOTE_DONE 			: if(new_note)
												next_state = WAIT_SCLK_LOW;
										
					WAIT_SCLK_HIGH		: if(sample_clk)
												next_state = WAIT_SCLK_LOW;
												
					INCREMENT         : next_state = COUNT_INCREMENT;
					
					COUNT_INCREMENT	: next_state = CHECK_NOTE_DONE;
					
					CHECK_NOTE_DONE   : 
											 begin
											 
											  if(count_done)
												next_state = NOTE_DONE;
											  else
												next_state = WAIT_SCLK_HIGH;
												
											 end
											 
					
					WAIT_SCLK_LOW     : if(~sample_clk)
												next_state = INCREMENT;
												
			endcase


			case (curr_state)
			
			WAIT_START, WAIT_SCLK_LOW, CHECK_NOTE_DONE, NOTE_DONE, WAIT_SCLK_HIGH:
			begin
				increment = 1'b0;
				Done = 1'b0;
				count_inc = 1'b0;
			end
		
			
			INCREMENT :
			begin
				increment = 1'b1;
				Done = 1'b0;
				count_inc = 1'b0;
			end
			
			COUNT_INCREMENT :
			begin
				increment = 1'b0;
				Done = 1'b0;
				count_inc = 1'b1;
			end
	
			default :
			begin
				increment = 1'b0;
				Done = 1'b0;
				count_inc = 1'b0;
			end
			
			endcase
	end
endmodule
