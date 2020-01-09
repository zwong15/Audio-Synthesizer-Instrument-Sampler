module audio_interface_plat(

input wire Clk, Reset, INIT, AUD_DACLRCK, AUD_BCLK,
input wire [15:0] DATA, 
output wire INIT_FINISH, AUD_MCLK, AUD_DACDAT, I2C_SDAT, I2C_SCLK, data_over

);

wire adc_full;
wire [31:0] ADCDATA;


audio_interface  A1(

.Clk(Clk), 
.Reset(Reset),
.INIT(INIT),
.data_over(data_over),
.init_finish(INIT_FINISH),
.AUD_MCLK(AUD_MCLK),
.AUD_DACDAT(AUD_DACDAT),
.I2C_SDAT(I2C_SDAT),
.I2C_SCLK(I2C_SCLK),
.AUD_BCLK(AUD_BCLK),
.LDATA(DATA),
.RDATA(DATA),
.AUD_DACLRCK(AUD_DACLRCK),
.adc_full(adc_full),
.ADCDATA(ADCDATA)

);

endmodule
