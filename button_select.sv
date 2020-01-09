module button_select(

input logic Clk, Reset, button, 
output logic [1:0] function_select

);


enum logic [3:0] {

FUNCTION_0_LOW,
FUNCTION_0_HIGH,
FUNCTION_1_LOW,
FUNCTION_1_HIGH,
FUNCTION_2_LOW,
FUNCTION_2_HIGH,
FUNCTION_3_LOW,
FUNCTION_3_HIGH,
FUNCTION_4_LOW,
FUNCTION_4_HIGH


}   curr_state, next_state;




	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= FUNCTION_0_LOW;
        else 
            curr_state <= next_state;
    end

	 
	 always_comb
    begin
        
			next_state  = curr_state;	
			unique case (curr_state) 
			
			FUNCTION_0_LOW :	if(button)
										next_state = FUNCTION_0_HIGH;
			
			FUNCTION_0_HIGH :	if(~button)
										next_state = FUNCTION_1_LOW;
										
										
			FUNCTION_1_LOW :	if(button)
										next_state = FUNCTION_1_HIGH;
			
			FUNCTION_1_HIGH :	if(~button)
										next_state = FUNCTION_2_LOW;
										
										
										
			FUNCTION_2_LOW :	if(button)
										next_state = FUNCTION_2_HIGH;
			
			FUNCTION_2_HIGH :	if(~button)
										next_state = FUNCTION_3_LOW;
										
										
										
			FUNCTION_3_LOW :	if(button)
										next_state = FUNCTION_3_HIGH;
			
			FUNCTION_3_HIGH :	if(~button)
										next_state = FUNCTION_0_LOW;
			
			
			endcase
			
			case (curr_state)
			
				FUNCTION_0_LOW, FUNCTION_0_HIGH:  function_select = 2'd0;
				
				FUNCTION_1_LOW, FUNCTION_1_HIGH:  function_select = 2'd1;
				
				FUNCTION_2_LOW, FUNCTION_2_HIGH:  function_select = 2'd2;
				
				FUNCTION_3_LOW, FUNCTION_3_HIGH:  function_select = 2'd3;
						
			endcase
			
	end

endmodule
