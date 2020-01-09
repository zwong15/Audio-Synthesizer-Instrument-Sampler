module KeyMapper_(

input logic [7:0] keyboard_in,
output logic [3:0] highlight_on

);


always_comb
begin
	case(keyboard_in)
		
		8'd43: //key 1`
		
			highlight_on = 4'd1;
		
		8'd20: //key 2

			highlight_on = 4'd2;

		8'd26: //key 3
		
			highlight_on = 4'd3;	
			
		8'd8: //key 4
		
			highlight_on = 4'd4;
			
		8'd21: //key 5
		
			highlight_on = 4'd5;
			
		8'd23: //key 6
			
			highlight_on = 4'd6;			
			
		8'd28: //key 7
			
			highlight_on = 4'd7;
			
		8'd24: //key 8
			
			highlight_on = 4'd8;			
			
		8'd12: //key 9
			
			highlight_on = 4'd9;
			
		8'd18: //key 10
			
			highlight_on = 4'd10;			
			
		8'd19: //key 11
			
			highlight_on = 4'd11;
			
		8'd47: //key 12
			
			highlight_on = 4'd12;			
		
		default:
			
			highlight_on = 4'd0;
			
	endcase
end

endmodule
