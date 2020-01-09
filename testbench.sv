module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

//for top level
//logic CLOCK_50 = 0;
//logic AUD_BCLK = 0;
//logic AUD_DACLRCK = 0;
//logic [3:0] KEY;
//logic [6:0]  HEX0, HEX1;
//logic AUD_XCK, AUD_DACDAT, I2C_SDAT, I2C_SCLK;
//logic [7:0] keycode;
//
//Final_Project_top plat(.*);
//
//initial begin: CLOCK_INITIALIZATION
//    CLOCK_50 = 0;
//	 AUD_BCLK = 0;
//	 AUD_DACLRCK = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 CLOCK_50 = ~CLOCK_50;
//end
//
//always begin : BCLK_GENERATE
//#8 AUD_BCLK = ~AUD_BCLK;
//end
//
//always begin : LR_GENERATION
//#128 AUD_DACLRCK = ~AUD_DACLRCK;
//end

//for button_select

//logic Clk = 0;
//logic Reset, button;
//logic [1:0] function_select;
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end



//for note control
//logic Clk = 0;
//logic sample_clk = 0;
//logic init, Reset, done;
//logic [7:0] keycode;
//logic [19:0] note_address;
//
//samplerAddressControl  SAC(.*);
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//	 sample_clk = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end
//
//always begin : BCLK_GENERATE   //set bit clock to run 8 times slower than FPGA Clock
//#50 sample_clk = ~sample_clk;
//end



//wavetable
//logic Clk = 0;
//logic sample_clk = 0;
//logic CS, Reset, 



//for multi note control
//logic Clk = 0;
//logic sample_clk = 0;
//logic init, Reset, OE;
//logic [1:0] addr_sel;
//logic [31:0] keycode;
//logic [19:0] sram_address;
//logic [15:0] sram_data, audio_data;
//
//
//NoteProducer  MULTI(.*);
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//	 sample_clk = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end
//
//always begin : BCLK_GENERATE   //set bit clock to run 8 times slower than FPGA Clock
//#50 sample_clk = ~sample_clk;
//end



//testing SRAM communication
//logic Clk = 0;
//logic init;
//logic [3:0] KEY;
//logic [31:0] keycode;
//wire [15:0] Data;
//logic [19:0] A;
//
//memoryTestingTopLevel	TEST(.*);
//
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end



//for Codec Driver
//logic Clk = 0;					//FPGA Clock
//logic AUD_DACLRCK = 0;		//Left Right Clock, which comes from DAC
//logic AUD_BCLK = 0;			//Bit Clock, which comes from DAC
//logic AUD_MCLK = 0;			//Master Clock that goes to DAC, sent from DAC
//
//logic Reset;               //Resets driver
//logic INIT;						//set init to high to start initialization process, will take several clock cycles to complete
//logic INIT_FINISH;			//output signal from driver that is set to 1, when init process is done
//logic I2C_SDAT;				//Serial Data for Codec I2C
//logic I2C_SCLK;				//I2C codec Clock
//logic data_over;				//is set high for a clock cycle when a single word has been transmitted to DAC
//logic AUD_DACDAT;				//Serial data output from driver to DAC
//logic [15:0] DATA;			//Data being inputted to left and right channel of DAC
//
//
//audio_interface_plat  codec_driver(.*);
//
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//	 AUD_BCLK = 0;
//	 AUD_DACLRCK = 0;
//end 
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end
//
//always begin : BCLK_GENERATE   //set bit clock to run 8 times slower than FPGA Clock
//#8 AUD_BCLK = ~AUD_BCLK;
//end
//
//always begin : LR_GENERATION  //set bit clock to run 128 times slower than FPGA Clock
//#128 AUD_DACLRCK = ~AUD_DACLRCK;
//end



//for wavetable synth
//logic Clk = 0;
//logic Reset, CS, sample_Clk;
//logic [23:0] freq;
//logic [15:0] out;
//
//wavetable_synthesizer synth(.*);
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//	 sample_Clk = 0;
//end
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end
//
//always begin : SAMPLE_CLOCK_GENERATION
//#8 sample_Clk = ~sample_Clk;
//#2 sample_Clk = ~sample_Clk;
//end



initial begin: TEST_VECTORS
//button_select
//Reset = 0;
//button = 0;
//
//#2 Reset = 1;
//#2 Reset = 0;
//
//#2 button = 1;
//#8 button = 0;
//
//#2 button = 1;
//#8 button = 0;


//for top level
//KEY = 4'b1111;
//keycode = 256'd35;
//
//
//#2 KEY[0] = 0;
//#2 KEY[0] = 1;
//
//#2 KEY[3] = 0;
//#2 KEY[3] = 1;

//for Codec Driver
//Reset = 0;
//DATA = 16'b011011011011;
//
//
//#2 Reset = 1;
//#2 Reset = 0;
//
//
////sets init to 1 to start codec initiliazation process
//#2 INIT = 1;




//for wavetable synth
//Reset = 0;
//CS = 0;
//freq = 24'h021287;
//
//#2 Reset = 1;
//#2 Reset = 0;
//
//#2 CS = 1;







//for top project
//KEY = 4'b1111;
//keycode = 256'd26;
//AUD_BCLK = 0;
//AUD_DACLRCK = 0;
//
//#1041 KEY[0] = 1'b1;
//#6 KEY[0] = 1'b1;
//
//#2 KEY[3] = 1'b0;
//#2 KEY[3] = 1'b1;


//for note address control
//Reset = 0;
//keycode = 256'd43;
//
//#2 Reset = 1;
//#2 Reset = 0;
//
//#4 init = 1;
//#2 init = 0;
//
//#2 keycode = 256'd0;
//#4 keycode = 256'd43;
//
//#100 keycode = 256'd0;
//#6  keycode = 256'd20;




//for multi_note control
//Reset = 0;
//init = 0;
//keycode = {24'b0, 8'd20};
//addr_sel = 0;
//
//#2 Reset = 1;
//#2 Reset  = 0;
//
//#2 init = 1;
//#2 init = 0;
//
//#2 keycode = {24'b0, 8'd0};
//#2 keycode = {8'd20, 8'd20, 8'd20, 8'd20};
//
//#400 addr_sel = 2'd1;
//#400 addr_sel = 2'd2;


//testing sram communication
//init = 0;
//KEY = 4'b1111;
//keycode = {8'd2, 8'd3, 8'd4, 8'd5};
//
//
//#2 KEY[0] = 0;
//#2 KEY[0] = 1;
//
//#4 init = 1;
//#4 init = 0;
//
//#4 keycode = 32'd0;
//#4 keycode = {8'd5, 8'd0, 8'd0, 8'd2};
//#20 keycode = {8'd0, 8'd4, 8'd3, 8'd2};



//wavetable


end
endmodule
