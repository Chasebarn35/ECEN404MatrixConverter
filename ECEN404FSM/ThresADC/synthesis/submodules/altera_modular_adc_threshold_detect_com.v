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

module altera_modular_adc_threshold_detect_com (
    input           clk,
    input           rst_n,
    input           en_low_thd,
    input           en_high_thd,
    input [11:0]    rsp_data,
    input [4:0]     rsp_channel,
    input [11:0]    low_thd_val,
    input [11:0]    high_thd_val,
    output          low_err,
    output          high_err
);

wire temp_sense_mode;
wire low_err_tmp;
wire high_err_tmp;

assign temp_sense_mode = (rsp_channel == 5'b10001);

//--------------------------------------------------------------------------------------------//
// Comparator
//--------------------------------------------------------------------------------------------//
assign low_err  = en_low_thd ? low_err_tmp : 1'b0;
assign high_err = en_high_thd ? high_err_tmp : 1'b0;


assign low_err_tmp  = temp_sense_mode ? (rsp_data > low_thd_val) : (rsp_data < low_thd_val);
assign high_err_tmp = temp_sense_mode ? (rsp_data < high_thd_val) : (rsp_data > high_thd_val);

endmodule
