module Final_Project_top( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
             // CY7C67200 Interface
             inout  wire  [15:0] OTG_DATA,     //CY7C67200 Data bus 16 Bits
             output logic [1:0]  OTG_ADDR,     //CY7C67200 Address 2 Bits
             output logic        OTG_CS_N,     //CY7C67200 Chip Select
                                 OTG_OE_N,     //CY7C67200 Write
                                 OTG_WE_N,     //CY7C67200 Read
                                 OTG_RST_N,    //CY7C67200 Reset
             input        [1:0]  OTG_INT,      //CY7C67200 Interrupt


             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N,    //SDRAM Chip Select
                                 DRAM_CLK,     //SDRAM Clock


				//DAC Interface
				input logic 			AUD_BCLK,		//bit clock
				input logic 			AUD_DACLRCK,	//WS
				output logic 			AUD_XCK,  		//master clock
				output logic 			AUD_DACDAT,		//serial data
				output logic 			I2C_SCLK,		//I2C clock
				output logic 			I2C_SDAT,      //I2C serial data



				//SRAM Interface
				inout wire [15:0] SRAM_DQ,
				output logic [19:0] SRAM_ADDR,
				output logic SRAM_CE_N, SRAM_UB_N, SRAM_LB_N, SRAM_OE_N, SRAM_WE_N

				//input logic [31:0] keycode,
				//input logic start
				
                    );
    
    logic Reset_h, Clk;
	 logic OE;
    logic [31:0] keycode;
	 logic [3:0] highlight_on, highlight_on1, highlight_on2, highlight_on3;
	 logic [3:0] is_rec;
	 logic [4:0] is_sprite;
	 logic [9:0] DrawX, DrawY;

    
		assign Clk = CLOCK_50;
		
		//set all values but read to appropriate values
		assign SRAM_CE_N = 1'b0;
		assign SRAM_UB_N = 1'b0;
		assign SRAM_LB_N = 1'b0;
		assign SRAM_OE_N = OE;
		assign SRAM_WE_N = 1'b1;
		
	 	 

		
    always_ff @ (posedge Clk) begin
        Reset_h <= ~(KEY[0]);        // The push buttons are active low
    end
    
    logic [1:0] hpi_addr;
    logic [15:0] hpi_data_in, hpi_data_out;
    logic hpi_r, hpi_w, hpi_cs, hpi_reset, freq_1;
    
    // Interface between NIOS II and EZ-OTG chip
    hpi_io_intf hpi_io_inst(
                            .Clk(Clk),
                            .Reset(Reset_h),
                            // signals connected to NIOS II
                            .from_sw_address(hpi_addr),
                            .from_sw_data_in(hpi_data_in),
                            .from_sw_data_out(hpi_data_out),
                            .from_sw_r(hpi_r),
                            .from_sw_w(hpi_w),
                            .from_sw_cs(hpi_cs),
                            .from_sw_reset(hpi_reset),
                            // signals connected to EZ-OTG chip
                            .OTG_DATA(OTG_DATA),    
                            .OTG_ADDR(OTG_ADDR),    
                            .OTG_RD_N(OTG_OE_N),    
                            .OTG_WR_N(OTG_WE_N),    
                            .OTG_CS_N(OTG_CS_N),
                            .OTG_RST_N(OTG_RST_N)
    );
     
     // You need to make sure that the port names here match the ports in Qsys-generated codes.
     nios_system nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keyboard_export(keycode),  
                             .otg_hpi_addr_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_read_export(hpi_r),
                             .otg_hpi_write_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset)
    );
	 
	 //synth logic variables
	 logic init_done, init, chip_sel, program_start, data_over, sample_clk;
	 logic [15:0] Data_to_SRAM, Data_from_SRAM;
	 logic start;
	 logic choose_prog;
	 logic [1:0] function_select;
	 logic [15:0] data_out, data_out_synth, data_to_dac;
    
	//modules for synthesizer
    vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));
	 
	 VGA_controller vga_controller_instance(.Clk(Clk), .Reset(Reset_h), .VGA_HS(VGA_HS), .VGA_VS(VGA_VS), .VGA_CLK(VGA_CLK), .VGA_BLANK_N(VGA_BLANK_N), .VGA_SYNC_N(VGA_SYNC_N), .DrawX(DrawX), .DrawY(DrawY));
	 
	 
	 //controller and driver for audio interface platform
	 controller 					control(.Clk(Clk), .Reset(Reset_h), .init_finish(start), .start(program_start), .init(init), .CS(chip_sel));
	 audio_interface_plat      audio_transmit(.Clk(Clk), .Reset(Reset_h), .INIT(init), .DATA(data_to_dac), .INIT_FINISH(start), .I2C_SDAT(I2C_SDAT), .I2C_SCLK(I2C_SCLK), .AUD_BCLK(AUD_BCLK), .AUD_DACLRCK(AUD_DACLRCK), .AUD_DACDAT(AUD_DACDAT), .data_over(data_over));
	 
	 //creates polyphonic sine synth
	 multiple_wavetable_module 		sine_synth1(.Clk(Clk), .keycode(keycode), .Reset(Reset_h), .CS(chip_sel), .data_out(data_out_synth), .sample_clk(sample_clk)); 
    
	 //synchronizers for buttons
	 sync          				butt_sync1(.Clk(Clk), .d(~KEY[3]), .q(program_start));  //Key 3 starts program
	 sync          				butt_sync2 (.Clk(Clk), .d(~KEY[2]), .q(choose_prog));	//Key 2 changes data output/function
	 
	 
	 //controls mode
	 
	 //MODE 1: Piano-single note
	 //MODE 2: Piano-polyphonic
	 //MODE 3: Drum Sampler
	 //MODE 4: Wavetable Synth
	 
	 button_select				   BUTT_SEL(.Clk(Clk), .Reset(Reset_h), .button(choose_prog), .function_select(function_select));
	 MUX4_DATA						DATA_MUX(.in1(data_out), .in2(data_out), .in3(data_out), .in4(data_out_synth), .out(data_to_dac), .select(function_select));
	 
	 
	 //clock dividers
	 clock_divider_sample		SCLK(.Reset(Reset_h), .clock_in(Clk), .clock_out(sample_clk));
	 clock_divider_MCLK        MCLK(.Reset(Reset_h), .clock_in(Clk), .clock_out(AUD_XCK));
	 
	 //VGA modules
	 KeyMapper_ key_mapper_instance(.keyboard_in(keycode[7:0]), .highlight_on(highlight_on));
	
	 KeyMapper_ key_mapper_instance1(.keyboard_in(keycode[15:8]), .highlight_on(highlight_on1));
	 
	 KeyMapper_ key_mapper_instance2(.keyboard_in(keycode[23:16]), .highlight_on(highlight_on2));
	 
	 KeyMapper_ key_mapper_instance3(.keyboard_in(keycode[31:24]), .highlight_on(highlight_on3));
	 
	 keyboard keyboard_instance(.Clk(Clk), .Reset(Reset_h), .frame_clk(VGA_VS), .highlighter_(highlight_on), .highlighter_1(highlight_on1), .highlighter_2(highlight_on2), .highlighter_3(highlight_on3), .DrawX(DrawX), .DrawY(DrawY), .is_rec(is_rec));
    
    Sprite_Color_Mapper Sprite_Color_Mapper_instance(.key_highlight(highlight_on), .function_mode(function_select), .DrawX(DrawX), .DrawY(DrawY), .is_sprite(is_sprite));
	 
	 color_mapper color_instance(.is_rec(is_rec), .sprite_on(is_sprite), .DrawX(DrawX), .DrawY(DrawY), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B));
	 
	 
	 //note sampler
	 NoteProducer  NOTE(.keycode(keycode), .sram_data(Data_from_SRAM), .Clk(Clk), .Reset(Reset_h), .addr_sel(function_select), .sample_clk(sample_clk), .init(chip_sel), .OE(OE), .sram_address(SRAM_ADDR), .audio_data(data_out));
	 
	 
    // Display SRAM ADDRESS on hex display
    HexDriver hex_inst_0 (SRAM_ADDR[3:0], HEX0);
    HexDriver hex_inst_1 (SRAM_ADDR[7:4], HEX1);
	 HexDriver hex_inst_2 (SRAM_ADDR[11:8], HEX2);
    HexDriver hex_inst_3 (SRAM_ADDR[15:12], HEX3);
	 
	 // Display SRAM ADDRESS on hex display
    HexDriver hex_inst_4 ({2'b0, function_select[1:0]}, HEX4);
	 HexDriver hex_inst_5 (4'b0, HEX5);
	 HexDriver hex_inst_6 (4'b0, HEX6);
	 HexDriver hex_inst_7 (4'b0, HEX7);

	 
	 
	 
	 // The tri-state buffer serves as the interface between Mem2IO and SRAM
	 tristate #(.N(16)) tr0(
		.Clk(Clk), .tristate_output_enable(~SRAM_WE_N), .Data_write(Data_to_SRAM), .Data_read(Data_from_SRAM), .Data(SRAM_DQ)
	 );
    
    /**************************************************************************************
        ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
        Hidden Question #1/2:
        What are the advantages and/or disadvantages of using a USB interface over PS/2 interface to
             connect to the keyboard? List any two.  Give an answer in your Post-Lab.
    **************************************************************************************/
endmodule
