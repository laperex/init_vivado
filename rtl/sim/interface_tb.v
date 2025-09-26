`timescale 10ns / 1ns


module interface_tb;
	reg clk = 0;
	reg reset = 1;

	always #0.5 clk = ~clk;
	
	initial #50 reset = 0;

	wire [15: 0] led;
	wire btnC;
	wire RsTx;

	assign btnC = reset;

	interface m_interface(clk, btnC, btnL, RsRx, RsTx, led);
endmodule
