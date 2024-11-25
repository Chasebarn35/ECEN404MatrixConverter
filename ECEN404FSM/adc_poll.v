module adc_threshold_monitor (
    input wire clk,
    input wire reset_n,                      // Active-low reset
    output wire [2:0] threshold_exceeded      // Output bits: 3 bits for each ADC channel (1 = exceeded)
);

    // Signals from ADC_PLL module
    wire threshold_valid;
    wire [4:0] threshold_channel;
    wire threshold_data;

    // Instantiate ADC_PLL module
    ThresADC u_adc_pll (
        .clk_clk(clk),
        .reset_reset_n(reset_n),
        .modular_adc_0_threshold_valid(threshold_valid),
        .modular_adc_0_threshold_channel(threshold_channel),
        .modular_adc_0_threshold_data(threshold_data)
    );

    // Internal register to hold threshold states for 3 channels
    reg [2:0] channel_threshold;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            // Reset all channels' threshold status
            channel_threshold <= 3'b000;
        end else begin
            // Check if valid threshold data is available
            if (threshold_valid) begin
                case (threshold_channel)
                    5'd0: channel_threshold[0] <= threshold_data;  // ADC Channel 1
                    5'd1: channel_threshold[1] <= threshold_data;  // ADC Channel 2
                    5'd2: channel_threshold[2] <= threshold_data;  // ADC Channel 3
                    default: begin end /* Do nothing if unknown channel */
                endcase
            end
        end
    end

    // Assign output threshold exceeded signal (1 = exceeded, 0 = below threshold)
    assign threshold_exceeded = channel_threshold;

endmodule