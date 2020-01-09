module pulse(

input logic  Clk, data, Reset,
output logic out

);

logic data_high;

enum logic [1:0] {
WAIT,
HIGH,
LOW

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
				
				WAIT			: if(data)
									next_state = HIGH;
									
				HIGH			: next_state = LOW;
				
				LOW			: if(~data)
									next_state = WAIT;
								  
								  
					
				default     : next_state = WAIT;
        endcase
		  
		case (curr_state) 
		
		WAIT, LOW :
			out = 1'b0;
		
		HIGH :
			out = 1'b1;
		
		endcase
		  
	 end
	 
endmodule
