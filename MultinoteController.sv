module MultinoteController(

input logic Clk, Reset, sample_clk, init,
input logic [1:0] addr_sel,
output logic MAR_LD, MDR_LD1, MDR_LD2, MDR_LD3, MDR_LD4, OE, 
output logic [1:0] select

);

enum logic [5:0] {

WAIT_START,
WAIT_SCLK_HIGH,
WAIT_SCLK_LOW,
LOAD_MAR1,
RAM_WAIT1_1,
RAM_WAIT1_2,
STORE_MDR1,
SELECT_CHECK,

LOAD_MAR2,
RAM_WAIT2_1,
RAM_WAIT2_2,
STORE_MDR2,

LOAD_MAR3,
RAM_WAIT3_1,
RAM_WAIT3_2,
STORE_MDR3,

LOAD_MAR4,
RAM_WAIT4_1,
RAM_WAIT4_2,
STORE_MDR4

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
												next_state = WAIT_SCLK_LOW;
												
					WAIT_SCLK_HIGH		: if(sample_clk)
												next_state = WAIT_SCLK_LOW;
												
												
					LOAD_MAR1			:  next_state = RAM_WAIT1_1;
					
					RAM_WAIT1_1       :  next_state = RAM_WAIT1_2;
					
					RAM_WAIT1_2			:  next_state = STORE_MDR1;
					
					STORE_MDR1			:  next_state = SELECT_CHECK;
					
					SELECT_CHECK		: if(addr_sel == 2'd0)
												next_state = WAIT_SCLK_HIGH;
												
											  else
												next_state = LOAD_MAR2;
					
					
												
					LOAD_MAR2			:  next_state = RAM_WAIT2_1;
					
					RAM_WAIT2_1       :  next_state = RAM_WAIT2_2;
					
					RAM_WAIT2_2			:  next_state = STORE_MDR2;
					
					STORE_MDR2			:  next_state = LOAD_MAR3;
					
					
												
					LOAD_MAR3			:  next_state = RAM_WAIT3_1;
					
					RAM_WAIT3_1       :  next_state = RAM_WAIT3_2;
					
					RAM_WAIT3_2			:  next_state = STORE_MDR3;
					
					STORE_MDR3			:  next_state = LOAD_MAR4;
					
					
												
					LOAD_MAR4			:  next_state = RAM_WAIT4_1;
					
					RAM_WAIT4_1       :  next_state = RAM_WAIT4_2;
					
					RAM_WAIT4_2			:  next_state = STORE_MDR4;
					
					STORE_MDR4			:  next_state = WAIT_SCLK_HIGH;
					
					
					
					WAIT_SCLK_LOW		:  if(~sample_clk)
													next_state = LOAD_MAR1;
										
					
												
			endcase
			
			
			
			case (curr_state)
			
				WAIT_START, WAIT_SCLK_HIGH, WAIT_SCLK_LOW, SELECT_CHECK:
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				
				LOAD_MAR1:
				begin
					OE = 1'b1;
					MAR_LD = 1'b1;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				LOAD_MAR2:
				begin
					OE = 1'b1;
					MAR_LD = 1'b1;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b01;
				end
				
				LOAD_MAR3:
				begin
					OE = 1'b1;
					MAR_LD = 1'b1;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b10;
				end
				
				
				LOAD_MAR4:
				begin
					OE = 1'b1;
					MAR_LD = 1'b1;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b11;
				end
				
				
				RAM_WAIT1_1, RAM_WAIT1_2:
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				RAM_WAIT2_1, RAM_WAIT2_2:
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b01;
				end

				
				RAM_WAIT3_1, RAM_WAIT3_2:
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b10;
				end

				
				RAM_WAIT4_1, RAM_WAIT4_2:
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b11;
				end


				
				STORE_MDR1 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b1;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				STORE_MDR2 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b1;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b01;
				end
				
				STORE_MDR3 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b1;
					MDR_LD4 = 1'b0;
					select= 2'b10;
				end
				
				STORE_MDR4 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b1;
					select= 2'b11;
				end
				
				default :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
			endcase
	end
	 
endmodule
