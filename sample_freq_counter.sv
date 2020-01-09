module sample_freq_counter(

input logic Reset, Clk,
output logic freq_sample

);

//converts 50 MHz clock signal to a 48khz clock signal

logic [12:0] count;



always_ff @ (posedge Clk)
begin
	if(Reset)
	begin
		count = 13'b0;
		freq_sample <= 1'b0;
	end
	
	else if(count == 13'b0)
		begin
			count <= count + 12'b01;
			freq_sample <= 1'b0;
		end
		
	else if((count == 13'd1042))	
		begin
			count <= count + 13'b01;
			freq_sample <= 1'b1;
		end
		
	else if((count == 13'd2083))
		begin
			count <= 13'b0;
		end
		
	else
		begin
			count <= count + 13'b01;
			freq_sample <= freq_sample;
		end
end

endmodule
