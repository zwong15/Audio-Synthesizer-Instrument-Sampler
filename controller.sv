module controller(

input logic Clk, Reset, init_finish, start,
output logic init, CS

);


enum logic [2:0] {
WAIT,
WAIT_1,
DAC_WAIT,
RUN,
RUN_1
}   curr_state, next_state;

always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= WAIT;
        else 
            curr_state <= next_state;
    end

	 
	 always_comb
    begin  
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 
				WAIT    		: if(start == 1)
										next_state = WAIT_1;
				WAIT_1  		: if(start == 0)
										next_state = DAC_WAIT;
				
				DAC_WAIT    : if(init_finish == 1)
										next_state = RUN;
				RUN      	: if(start == 1)
										next_state = RUN_1;
										
				RUN_1      	: if(start == 0)
										next_state = WAIT;
										
				default     : next_state = WAIT;
        endcase
		  
		  case (curr_state) 
				
	   	   WAIT: 
	         begin
               init = 1'b0;
					CS = 1'b0;
				end
				
				WAIT_1: 
	         begin
               init = 1'b0;
					CS = 1'b0;
				end
				
				DAC_WAIT: 
	         begin
               init = 1'b1;
					CS = 1'b0;
				end
				
				RUN, RUN_1: 
	         begin
               init = 1'b1;
					CS = 1'b1;
				end
				
				default:
				begin
					init = 1'b0;
					CS = 1'b0;
				end
				
			endcase
		  
	 end
	 
endmodule
