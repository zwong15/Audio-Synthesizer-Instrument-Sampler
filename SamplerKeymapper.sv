module SamplerKeymapper_keyboard(

input logic [7:0] keyboard_in,
output logic [19:0] note_addr,
output logic invalid_note

);

always_comb
begin
	case(keyboard_in)
	
		256'd43: //Tab
		begin
			note_addr = 20'h08c0; //C
			invalid_note = 1'b0;
		end
			
		256'd20: //Q
		begin
			note_addr = 20'h089c0; //Db
			invalid_note = 1'b0;
		end
			
		256'd26: //W
		begin
			note_addr = 20'h102b0; //D
			invalid_note = 1'b0;
		end
			
		256'd8:  //E
		begin
			note_addr = 20'h183a0; //Eb
			invalid_note = 1'b0;
		end
		
		256'd21: //R
		begin
			note_addr = 20'h20540; //E
			invalid_note = 1'b0;
		end
			
		256'd23: //T 
		begin
			note_addr = 20'h28638; //F
			invalid_note = 1'b0;
		end
			
		256'd28: //Y
		begin
			note_addr = 20'h30750; //Gb
			invalid_note = 1'b0;
		end
			
		256'd24: //U
		begin
			note_addr = 20'h388a0; //G
			invalid_note = 1'b0;
		end
			
		256'd12: //I
		begin
			note_addr = 20'h409c0; //Ab
			invalid_note = 1'b0;
		end
			
		256'd18: //O
		begin
			note_addr = 20'h48b08; //A
			invalid_note = 1'b0;
		end
	
		256'd19: //P
		begin
			note_addr = 20'h50c58; //Bb
			invalid_note = 1'b0;
		end
		
		256'd47: //{
		begin
			note_addr = 20'h58d50; //B
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
