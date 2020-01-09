module NoteProducer(

	input logic [31:0] keycode,
	input logic [15:0] sram_data,
	input logic [1:0] addr_sel,
	input logic Clk, Reset, sample_clk, init, 
	output logic OE,
	output logic [19:0] sram_address,
	output logic [15:0] audio_data

);

logic MAR_LD, MDR_LD1, MDR_LD2, MDR_LD3, MDR_LD4;
logic [1:0] select;
logic [15:0] MDR_in1, MDR_in2, MDR_in3, MDR_in4, MDR_out1, MDR_out2, MDR_out3, MDR_out4;
logic [19:0] note1_addr, note2_addr, note3_addr, note4_addr, MAR_in;


addressAdder					adder(.addr1(MDR_out1), .addr2(MDR_out2), .addr3(MDR_out3), .addr4(MDR_out4), .note_out(audio_data));
MultinoteController			Control(.Clk(Clk), .Reset(Reset), .sample_clk(sample_clk), .addr_sel(addr_sel), .init(init), .MAR_LD(MAR_LD), .MDR_LD1(MDR_LD1), .MDR_LD2(MDR_LD2), .MDR_LD3(MDR_LD3), .MDR_LD4(MDR_LD4), .OE(OE), .select(select));
MUX4								ADDR_SEL(.select(select), .addr1(note1_addr), .addr2(note2_addr), .addr3(note3_addr), .addr4(note4_addr), .addr_out(MAR_in));

reg_16							MDR1(.Clk(Clk), .Reset(Reset), .Load(MDR_LD1), .D(sram_data), .Data_Out(MDR_out1));
reg_16							MDR2(.Clk(Clk), .Reset(Reset), .Load(MDR_LD2), .D(sram_data), .Data_Out(MDR_out2));
reg_16							MDR3(.Clk(Clk), .Reset(Reset), .Load(MDR_LD3), .D(sram_data), .Data_Out(MDR_out3));
reg_16							MDR4(.Clk(Clk), .Reset(Reset), .Load(MDR_LD4), .D(sram_data), .Data_Out(MDR_out4));


reg_20							MAR(.Clk(Clk), .Reset(Reset), .Load(MAR_LD), .D(MAR_in), .Data_Out(sram_address));

samplerAddressControl		SAC1(.Clk(Clk), .Reset(Reset), .init(init), .addr_sel(addr_sel), .sample_clk(sample_clk), .keycode(keycode[7:0]), .note_address(note1_addr), .done(done1));
samplerAddressControl		SAC2(.Clk(Clk), .Reset(Reset), .init(init), .addr_sel(addr_sel), .sample_clk(sample_clk), .keycode(keycode[15:8]), .note_address(note2_addr), .done(done2));
samplerAddressControl		SAC3(.Clk(Clk), .Reset(Reset), .init(init), .addr_sel(addr_sel), .sample_clk(sample_clk), .keycode(keycode[23:16]), .note_address(note3_addr), .done(done3));
samplerAddressControl		SAC4(.Clk(Clk), .Reset(Reset), .init(init), .addr_sel(addr_sel), .sample_clk(sample_clk), .keycode(keycode[31:24]), .note_address(note4_addr), .done(done4));




endmodule
