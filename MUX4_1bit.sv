module MUX4_1bit (

input logic addr1, addr2, addr3, addr4,
input logic [1:0] select,
output logic addr_out

);

always_comb
begin

	case(select)	
	2'd0 :
		addr_out = addr1;
		
	2'd1 :
		addr_out = addr2;
	
	2'd2 :
		addr_out = addr3;
		
	2'd3 :
		addr_out = addr4;
		
	endcase

end

endmodule