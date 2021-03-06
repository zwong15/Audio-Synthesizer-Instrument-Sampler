module MUX4_DATA (

input logic [15:0] in1, in2, in3, in4,
input logic [1:0] select,
output logic [15:0] out

);

always_comb
begin

	case(select)	
	2'd0 :
		out = in1;
		
	2'd1 :
		out = in2;
	
	2'd2 :
		out = in3;
		
	2'd3 :
		out = in4;
		
	endcase

end

endmodule
