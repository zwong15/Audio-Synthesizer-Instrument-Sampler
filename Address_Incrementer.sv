module Address_Incrementer(

input logic [19:0] Address,
input logic invalid_note, increment, Clk, Reset,
output logic [19:0] next_Address,
output logic note_start

);

logic [19:0] curr_addr;
logic new_note;

assign note_start = new_note & (~invalid_note);  


//check if the current note matches the previous one
always_comb
begin
if(Address != curr_addr)
	new_note = 1'b1;
else
	new_note = 1'b0;
end

always_ff @ (posedge Clk)
begin
	
	if(Reset)
	begin
		next_Address <= 19'b0;
		curr_addr <= 19'b0;
	end
	
	else
	begin
		curr_addr <= Address;

		if(note_start)   //if there is a new valid note, set the address to beginning of note
			begin
				next_Address <= Address;
			end
			
		else if(increment)
			begin
				next_Address <= next_Address + 1;
			end
			
		else
			begin
				next_Address <= next_Address;
			end
	end
end


endmodule
