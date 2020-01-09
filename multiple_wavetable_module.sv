module multiple_wavetable_module(

input logic Clk, Reset, CS, sample_clk,
input logic [31:0] keycode,
output logic [15:0] data_out

);

logic sampler_in;
logic [23:0] freq1, freq2, freq3, freq4;
logic [15:0] dataOut1_harm1, dataOut2_harm1, dataOut3_harm1, dataOut4_harm1, dataOut1_harm2, dataOut2_harm2, dataOut3_harm2, dataOut4_harm2, dataOut1_harm3, dataOut2_harm3, dataOut3_harm3, dataOut4_harm3, dataOut1_harm4, dataOut2_harm4, dataOut3_harm4, dataOut4_harm4;
logic [15:0] dataOut1_harm5, dataOut1_harm6, dataOut2_harm5, dataOut2_harm6, dataOut3_harm5, dataOut3_harm6, dataOut4_harm5, dataOut4_harm6;

pulse										sample_clk_shorten(.Clk(Clk), .Reset(Reset), .data(sample_clk), .out(sampler_in));



wavetable_synthesizer 				sine_synth1(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm1), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_2 		sine_synth1_harm2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm2), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_3 		sine_synth1_harm3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm3), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_4 		sine_synth1_harm4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm4), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_5 		sine_synth1_harm5(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm5), .sample_Clk(sampler_in)); 
wavetable_synthesizer_harm_6 		sine_synth1_harm6(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1_harm6), .sample_Clk(sampler_in)); 
 
KeyMapper   							Mapper1(.keyboard_in(keycode[7:0]), .note_out(freq1));




wavetable_synthesizer 				sine_synth2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm1), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_2 		sine_synth2_harm2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm2), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_3 		sine_synth2_harm3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm3), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_4 		sine_synth2_harm4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm4), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_5 		sine_synth2_harm5(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm5), .sample_Clk(sampler_in)); 
wavetable_synthesizer_harm_6 		sine_synth2_harm6(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2_harm6), .sample_Clk(sampler_in));
  

KeyMapper   							Mapper2(.keyboard_in(keycode[15:8]), .note_out(freq2));




wavetable_synthesizer 				sine_synth3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm1), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_2 		sine_synth3_harm2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm2), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_3 		sine_synth3_harm3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm3), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_4 		sine_synth3_harm4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm4), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_5 		sine_synth3_harm5(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm5), .sample_Clk(sampler_in)); 
wavetable_synthesizer_harm_6 		sine_synth3_harm6(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq3), .out(dataOut3_harm6), .sample_Clk(sampler_in));  

KeyMapper   							Mapper3(.keyboard_in(keycode[23:16]), .note_out(freq3));




wavetable_synthesizer 				sine_synth4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm1), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_2 		sine_synth4_harm2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm2), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_3 		sine_synth4_harm3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm3), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_4 		sine_synth4_harm4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm4), .sample_Clk(sampler_in));
wavetable_synthesizer_harm_5 		sine_synth4_harm5(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm5), .sample_Clk(sampler_in)); 
wavetable_synthesizer_harm_6 		sine_synth4_harm6(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq4), .out(dataOut4_harm6), .sample_Clk(sampler_in));  

KeyMapper   							Mapper4(.keyboard_in(keycode[31:24]), .note_out(freq4));

assign data_out = dataOut1_harm1 + dataOut2_harm1 + dataOut3_harm1 + dataOut4_harm1 + dataOut1_harm2 + dataOut2_harm2 + dataOut3_harm2 + dataOut4_harm2 + dataOut1_harm3 + dataOut2_harm3 + dataOut3_harm3 + dataOut4_harm3 + dataOut1_harm4 + dataOut2_harm4 + dataOut3_harm4 + dataOut4_harm4 + dataOut1_harm5 + dataOut1_harm6 + dataOut2_harm5 + dataOut2_harm6 + dataOut3_harm5 + dataOut3_harm6 + dataOut4_harm5 + dataOut4_harm6;

endmodule
