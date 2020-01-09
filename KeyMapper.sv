module KeyMapper(

input logic [7:0] keyboard_in,
output logic [23:0] note_out

);

always_comb
begin
	case(keyboard_in)
			
		256'd43: //Tab
			note_out = 24'h015f27;//C4
			
		256'd20: //Q
			note_out = 24'h017406;//C4#
			
		256'd26: //W
			note_out = 24'h018a25;//D4
			
		256'd8:  //E
			note_out = 24'h01a197;//D4#
		
		256'd21: //R
			note_out = 24'h01ba6c;//E4
			
		256'd23: //T 
			note_out = 24'h01d4ba;//F4
			
		256'd28: //Y
			note_out = 24'h01f097;//F4#
			
		256'd24: //U
			note_out = 24'h020e22;//G4
			
		256'd12: //I
			note_out = 24'h022d68;//G4#
			
		256'd18: //O
			note_out = 24'h024e8f;//A4
	
		256'd19: //P
			note_out = 24'h0271ab;//A4#
		
		256'd47: //{
			note_out = 24'h0296e0;//B4
		
		default:
			note_out = 24'h000000;
		
	endcase
end



endmodule
