	component ThresADC is
		port (
			clk_clk                         : in  std_logic                    := 'X'; -- clk
			modular_adc_0_threshold_valid   : out std_logic;                           -- valid
			modular_adc_0_threshold_channel : out std_logic_vector(4 downto 0);        -- channel
			modular_adc_0_threshold_data    : out std_logic;                           -- data
			reset_reset_n                   : in  std_logic                    := 'X'  -- reset_n
		);
	end component ThresADC;

	u0 : component ThresADC
		port map (
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                     clk.clk
			modular_adc_0_threshold_valid   => CONNECTED_TO_modular_adc_0_threshold_valid,   -- modular_adc_0_threshold.valid
			modular_adc_0_threshold_channel => CONNECTED_TO_modular_adc_0_threshold_channel, --                        .channel
			modular_adc_0_threshold_data    => CONNECTED_TO_modular_adc_0_threshold_data,    --                        .data
			reset_reset_n                   => CONNECTED_TO_reset_reset_n                    --                   reset.reset_n
		);

