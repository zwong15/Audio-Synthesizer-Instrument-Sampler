module SamplerKeymapper_drum(

input logic [7:0] keyboard_in,
output logic [19:0] note_addr,
output logic invalid_note

);

always_comb
begin
	case(keyboard_in)
	
		256'd43: //Tab
		begin
			note_addr = 20'h60ee0; //Crash C
			invalid_note = 1'b0;
		end
			
		256'd20: //Q
		begin
			note_addr = 20'h68fb0; //Crash B
			invalid_note = 1'b0;
		end
			
		256'd26: //W
		begin
			note_addr = 20'h71130; //hi hat
			invalid_note = 1'b0;
		end
			
		256'd8:  //E
		begin
			note_addr = 20'h79230; //kick
			invalid_note = 1'b0;
		end
		
		256'd21: //R
		begin
			note_addr = 20'h81380; //tom-mid
			invalid_note = 1'b0;
		end
			
		256'd23: //T 
		begin
			note_addr = 20'h89470; //tom-high
			invalid_note = 1'b0;
		end
			
		256'd28: //Y
		begin
			note_addr = 20'h915c0; //ride
			invalid_note = 1'b0;
		end
			
		256'd24: //U
		begin
			note_addr = 20'h996f8; //snare
			invalid_note = 1'b0;
		end
			
		
		default:
		begin
			note_addr = 20'h0;  
			invalid_note = 1'b1;
		end
		
	endcase
end



endmodule