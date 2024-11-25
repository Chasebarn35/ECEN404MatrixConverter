	component unsaved is
		port (
			clk_clk           : in  std_logic := 'X'; -- clk
			pll_clk_50mhz_clk : out std_logic;        -- clk
			reset_reset_n     : in  std_logic := 'X'  -- reset_n
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --           clk.clk
			pll_clk_50mhz_clk => CONNECTED_TO_pll_clk_50mhz_clk, -- pll_clk_50mhz.clk
			reset_reset_n     => CONNECTED_TO_reset_reset_n      --         reset.reset_n
		);

