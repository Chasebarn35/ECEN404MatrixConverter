// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altera_modular_adc_threshold_detect #(
    parameter CH_LOW_EN = 18'h0,
    parameter CH_HIGH_EN = 18'h0,
    parameter CH0_LOW_VAL = 12'h100,
    parameter CH1_LOW_VAL = 12'h100,
    parameter CH2_LOW_VAL = 12'h100,
    parameter CH3_LOW_VAL = 12'h100,
    parameter CH4_LOW_VAL = 12'h100,
    parameter CH5_LOW_VAL = 12'h100,
    parameter CH6_LOW_VAL = 12'h100,
    parameter CH7_LOW_VAL = 12'h100,
    parameter CH8_LOW_VAL = 12'h100,
    parameter CH9_LOW_VAL = 12'h100,
    parameter CH10_LOW_VAL = 12'h100,
    parameter CH11_LOW_VAL = 12'h100,
    parameter CH12_LOW_VAL = 12'h100,
    parameter CH13_LOW_VAL = 12'h100,
    parameter CH14_LOW_VAL = 12'h100,
    parameter CH15_LOW_VAL = 12'h100,
    parameter CH16_LOW_VAL = 12'h100,
    parameter CH17_LOW_VAL = 12'h100,
    parameter CH0_HIGH_VAL = 12'h100,
    parameter CH1_HIGH_VAL = 12'h100,
    parameter CH2_HIGH_VAL = 12'h100,
    parameter CH3_HIGH_VAL = 12'h100,
    parameter CH4_HIGH_VAL = 12'h100,
    parameter CH5_HIGH_VAL = 12'h100,
    parameter CH6_HIGH_VAL = 12'h100,
    parameter CH7_HIGH_VAL = 12'h100,
    parameter CH8_HIGH_VAL = 12'h100,
    parameter CH9_HIGH_VAL = 12'h100,
    parameter CH10_HIGH_VAL = 12'h100,
    parameter CH11_HIGH_VAL = 12'h100,
    parameter CH12_HIGH_VAL = 12'h100,
    parameter CH13_HIGH_VAL = 12'h100,
    parameter CH14_HIGH_VAL = 12'h100,
    parameter CH15_HIGH_VAL = 12'h100,
    parameter CH16_HIGH_VAL = 12'h100,
    parameter CH17_HIGH_VAL = 12'h100
) (
    input               clk,
    input               rst_n,
    input               rsp_valid,
    input [4:0]         rsp_channel,
    input [11:0]        rsp_data,
    input               rsp_sop,
    input               rsp_eop,

    output reg          threshd_valid,
    output reg [4:0]    threshd_channel,
    output reg          threshd_data
);

reg [11:0]      low_thd_val;
reg [11:0]      high_thd_val;

wire [17:0]     ch_low_en_bus;
wire            en_low_thd;
wire [17:0]     ch_high_en_bus;
wire            en_high_thd;
wire            low_err;
wire            high_err;

//--------------------------------------------------------------------------------------------//
// Assign Low and High threshold enable parameter into vector bus
//--------------------------------------------------------------------------------------------//
assign ch_low_en_bus    = CH_LOW_EN;
assign ch_high_en_bus   = CH_HIGH_EN;



//--------------------------------------------------------------------------------------------//
// Low and High threshold enable mux
//--------------------------------------------------------------------------------------------//
assign en_low_thd       = ch_low_en_bus[rsp_channel];
assign en_high_thd      = ch_high_en_bus[rsp_channel];



//--------------------------------------------------------------------------------------------//
// Low and High threshold value mux
//--------------------------------------------------------------------------------------------//
always @* begin
    case (rsp_channel)
        5'h0: low_thd_val = CH0_LOW_VAL;
        5'h1: low_thd_val = CH1_LOW_VAL;
        5'h2: low_thd_val = CH2_LOW_VAL;
        5'h3: low_thd_val = CH3_LOW_VAL;
        5'h4: low_thd_val = CH4_LOW_VAL;
        5'h5: low_thd_val = CH5_LOW_VAL;
        5'h6: low_thd_val = CH6_LOW_VAL;
        5'h7: low_thd_val = CH7_LOW_VAL;
        5'h8: low_thd_val = CH8_LOW_VAL;
        5'h9: low_thd_val = CH9_LOW_VAL;
        5'ha: low_thd_val = CH10_LOW_VAL;
        5'hb: low_thd_val = CH11_LOW_VAL;
        5'hc: low_thd_val = CH12_LOW_VAL;
        5'hd: low_thd_val = CH13_LOW_VAL;
        5'he: low_thd_val = CH14_LOW_VAL;
        5'hf: low_thd_val = CH15_LOW_VAL;
        5'h10: low_thd_val = CH16_LOW_VAL;
        5'h11: low_thd_val = CH17_LOW_VAL;
        default: low_thd_val = CH0_LOW_VAL;
    endcase
end

always @* begin
    case (rsp_channel)
        5'h0: high_thd_val = CH0_HIGH_VAL;
        5'h1: high_thd_val = CH1_HIGH_VAL;
        5'h2: high_thd_val = CH2_HIGH_VAL;
        5'h3: high_thd_val = CH3_HIGH_VAL;
        5'h4: high_thd_val = CH4_HIGH_VAL;
        5'h5: high_thd_val = CH5_HIGH_VAL;
        5'h6: high_thd_val = CH6_HIGH_VAL;
        5'h7: high_thd_val = CH7_HIGH_VAL;
        5'h8: high_thd_val = CH8_HIGH_VAL;
        5'h9: high_thd_val = CH9_HIGH_VAL;
        5'ha: high_thd_val = CH10_HIGH_VAL;
        5'hb: high_thd_val = CH11_HIGH_VAL;
        5'hc: high_thd_val = CH12_HIGH_VAL;
        5'hd: high_thd_val = CH13_HIGH_VAL;
        5'he: high_thd_val = CH14_HIGH_VAL;
        5'hf: high_thd_val = CH15_HIGH_VAL;
        5'h10: high_thd_val = CH16_HIGH_VAL;
        5'h11: high_thd_val = CH17_HIGH_VAL;
        default: high_thd_val = CH0_HIGH_VAL;
    endcase
end



//--------------------------------------------------------------------------------------------//
// Threshold comparator block
//--------------------------------------------------------------------------------------------//
altera_modular_adc_threshold_detect_com u_threshd_com (
    .clk            (clk),
    .rst_n          (rst_n),
    .en_low_thd     (en_low_thd),
    .en_high_thd    (en_high_thd),
    .rsp_data       (rsp_data),
    .rsp_channel    (rsp_channel),
    .low_thd_val    (low_thd_val),
    .high_thd_val   (high_thd_val),
    .low_err        (low_err),
    .high_err       (high_err)
);



//--------------------------------------------------------------------------------------------//
// Output register for Avalon ST threshold Interface
//--------------------------------------------------------------------------------------------//
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        threshd_valid   <= 1'b0;
        threshd_channel <= 5'h0;
        threshd_data    <= 1'b0;
    end
    else if (rsp_valid & (low_err | high_err)) begin
        threshd_valid   <= 1'b1;
        threshd_channel <= rsp_channel;
        threshd_data    <= high_err;
    end
    else begin
        threshd_valid   <= 1'b0;
        threshd_channel <= 5'h0;
        threshd_data    <= 1'b0;
    end
end



endmodule
