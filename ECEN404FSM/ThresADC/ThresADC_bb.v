
module ThresADC (
	clk_clk,
	modular_adc_0_threshold_valid,
	modular_adc_0_threshold_channel,
	modular_adc_0_threshold_data,
	reset_reset_n);	

	input		clk_clk;
	output		modular_adc_0_threshold_valid;
	output	[4:0]	modular_adc_0_threshold_channel;
	output		modular_adc_0_threshold_data;
	input		reset_reset_n;
endmodule
