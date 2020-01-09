module SELECTOR(

input logic [15:0] Addr_in,
input logic [1:0] select,
output logic [15:0] out1, out2, out3, out4

);

always_comb
begin

	case(select)

	2'd0:
	begin
		out1 = Addr_in;
		out2 = 16'b0;
		out3 = 16'b0;
		out4 = 16'b0;
	end
	
	2'd1:
	begin
		out1 = 16'b0;
		out2 = Addr_in;
		out3 = 16'b0;
		out4 = 16'b0;
	end
	
	2'd2:
	begin
		out1 = 16'b0;
		out2 = 16'b0;
		out3 = Addr_in;
		out4 = 16'b0;
	end
	
	2'd3:
	begin
		out1 = 16'b0;
		out2 = 16'b0;
		out3 = 16'b0;
		out4 = Addr_in;
	end
	
	endcase
end

endmodule
