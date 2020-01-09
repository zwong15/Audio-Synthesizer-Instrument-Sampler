module samplerAddressControl(


input logic Clk, Reset, init, sample_clk,
input logic [7:0] keycode,
input logic [1:0] addr_sel,
output logic [19:0] note_address,
output logic done


);

logic new_note, count_done, count_inc, increment, invalid_note_key, invalid_note_drum, invalid_note;
logic [19:0] keymapper_address_key, keymapper_address_drum, keymapper_address;


SamplerKeymapper_keyboard		MAPPER_KEY(.keyboard_in(keycode), .note_addr(keymapper_address_key), .invalid_note(invalid_note_key));
SamplerKeymapper_drum			MAPPER_DRUM(.keyboard_in(keycode), .note_addr(keymapper_address_drum), .invalid_note(invalid_note_drum));

MUX4									ADDRMUX(.select(addr_sel), .addr1(keymapper_address_key), .addr2(keymapper_address_key), .addr3(keymapper_address_drum), .addr4(20'b0), .addr_out(keymapper_address));
MUX4_1bit							INVALIDMUX(.select(addr_sel), .addr1(invalid_note_key), .addr2(invalid_note_key), .addr3(invalid_note_drum), .addr4(1'b1), .addr_out(invalid_note));


Address_Incrementer				INCREMENTER(.Address(keymapper_address), .invalid_note(invalid_note), .increment(increment), .Clk(Clk), .Reset(Reset), .next_Address(note_address), .note_start(new_note));
noteCounter							COUNTER(.Clk(Clk), .Reset(Reset), .count_inc(count_inc), .note_change(new_note), .count_done(count_done));
incrementControl					CONTROL(.Clk(Clk), .Reset(Reset), .new_note(new_note), .count_done(count_done), .sample_clk(sample_clk), .init(init), .Done(done), .count_inc(count_inc), .increment(increment));

endmodule
