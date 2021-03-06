module wavetable_synthesizer_harm_2(

input logic Clk, Reset, CS, sample_Clk, 
input logic [23:0] freq,
output logic [15:0] out

);

//set up lookup table
reg	[15:0]	sin_table_2 [0:4095];
initial $readmemh("lookup2.hex", sin_table_2);


logic [23:0] frequency, phase;
logic [15:0] out_val;


always_ff @ (posedge Clk)
begin
	if(Reset|(~CS))
		begin
			frequency <= 24'b0;
			phase <= 24'b0;
		end
		
		else if(sample_Clk)
		begin
			//load freq val
			frequency <= (freq + freq);
		
			//add frequency to phase every cycle
			phase <= phase + frequency;
		end
		
		else
		begin
			//load value of frequency every clock cycle
			frequency <= (freq + freq);
		end
		
end

		//set output to wavetable value
		assign out_val = sin_table_2[phase[23:12]];

always_comb
begin
	case(CS)
		1'b0:
			out = 16'b0;
			
		1'b1:
			out = out_val;
	endcase
end

endmodule
