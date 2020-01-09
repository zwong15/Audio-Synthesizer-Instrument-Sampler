module addressAdder(

input logic [15:0] addr1, addr2, addr3, addr4,
output logic [15:0] note_out

);

assign note_out = addr1 + addr2 + addr3 + addr4;


endmodule
