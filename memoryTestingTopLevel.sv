module memoryTestingTopLevel(
input logic Clk, init,
input logic [3:0] KEY,
input logic [31:0] keycode,
output logic [19:0] A,
inout wire[15:0] Data //data 
);

						
logic CE, UB, LB, OE, WE; 

test_memory 		   test(.Clk(Clk), .Reset(Reset), .A(A), .I_O(Data), .CE(CE), .UB(UB), .LB(LB), .OE(OE), .WE(WE));

Final_Project_top    top(.CLOCK_50(Clk), .KEY(KEY), .keycode(keycode), .start(init), .SRAM_DQ(Data), .SRAM_ADDR(A), .SRAM_CE_N(CE), .SRAM_UB_N(UB), .SRAM_LB_N(LB), .SRAM_OE_N(OE), .SRAM_WE_N(WE));

endmodule
