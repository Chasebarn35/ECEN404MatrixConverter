// unsaved.v

// Generated using ACDS version 23.1 991

`timescale 1 ps / 1 ps
module unsaved (
		input  wire        clk_clk,           //           clk.clk
		input  wire [6:0]  output_address,    //        output.address
		input  wire        output_read,       //              .read
		input  wire        output_write,      //              .write
		input  wire [31:0] output_writedata,  //              .writedata
		output wire [31:0] output_readdata,   //              .readdata
		output wire        pll_clk_50mhz_clk, // pll_clk_50mhz.clk
		input  wire        reset_reset_n      //         reset.reset_n
	);

	wire    altpll_0_c0_clk;                    // altpll_0:c0 -> [modular_adc_1:adc_pll_clock_clk, modular_adc_1:clock_clk, rst_controller_001:clk]
	wire    altpll_0_locked_conduit_export;     // altpll_0:locked -> modular_adc_1:adc_pll_locked_export
	wire    rst_controller_reset_out_reset;     // rst_controller:reset_out -> altpll_0:reset
	wire    rst_controller_001_reset_out_reset; // rst_controller_001:reset_out -> modular_adc_1:reset_sink_reset_n

	unsaved_altpll_0 altpll_0 (
		.clk                (clk_clk),                        //       inclk_interface.clk
		.reset              (rst_controller_reset_out_reset), // inclk_interface_reset.reset
		.read               (),                               //             pll_slave.read
		.write              (),                               //                      .write
		.address            (),                               //                      .address
		.readdata           (),                               //                      .readdata
		.writedata          (),                               //                      .writedata
		.c0                 (altpll_0_c0_clk),                //                    c0.clk
		.c1                 (pll_clk_50mhz_clk),              //                    c1.clk
		.locked             (altpll_0_locked_conduit_export), //        locked_conduit.export
		.scandone           (),                               //           (terminated)
		.scandataout        (),                               //           (terminated)
		.c2                 (),                               //           (terminated)
		.c3                 (),                               //           (terminated)
		.c4                 (),                               //           (terminated)
		.areset             (1'b0),                           //           (terminated)
		.phasedone          (),                               //           (terminated)
		.phasecounterselect (3'b000),                         //           (terminated)
		.phaseupdown        (1'b0),                           //           (terminated)
		.phasestep          (1'b0),                           //           (terminated)
		.scanclk            (1'b0),                           //           (terminated)
		.scanclkena         (1'b0),                           //           (terminated)
		.scandata           (1'b0),                           //           (terminated)
		.configupdate       (1'b0)                            //           (terminated)
	);

	unsaved_modular_adc_1 modular_adc_1 (
		.clock_clk                  (altpll_0_c0_clk),                     //            clock.clk
		.reset_sink_reset_n         (~rst_controller_001_reset_out_reset), //       reset_sink.reset_n
		.adc_pll_clock_clk          (altpll_0_c0_clk),                     //    adc_pll_clock.clk
		.adc_pll_locked_export      (altpll_0_locked_conduit_export),      //   adc_pll_locked.export
		.sequencer_csr_address      (),                                    //    sequencer_csr.address
		.sequencer_csr_read         (),                                    //                 .read
		.sequencer_csr_write        (),                                    //                 .write
		.sequencer_csr_writedata    (),                                    //                 .writedata
		.sequencer_csr_readdata     (),                                    //                 .readdata
		.sample_store_csr_address   (output_address),                      // sample_store_csr.address
		.sample_store_csr_read      (output_read),                         //                 .read
		.sample_store_csr_write     (output_write),                        //                 .write
		.sample_store_csr_writedata (output_writedata),                    //                 .writedata
		.sample_store_csr_readdata  (output_readdata),                     //                 .readdata
		.sample_store_irq_irq       ()                                     // sample_store_irq.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (altpll_0_c0_clk),                    //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule