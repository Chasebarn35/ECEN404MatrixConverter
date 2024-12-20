//`timescale 1ns / 1ps



//Data is done BigEnding, [5:4] for Desired Load is A, so on so forth
//ABC
//AABBCC
//AAAAAABBBBBBCCCCCC

//CLK is defaulted to 50k Hz input
//rst is 1 for reset, 0 for function
//start starts when it goes to 1, off when 0
//st | Out
//0  | 1
//1  | 0


//When any short is signalled, I want it to be unable to be reset, as I want
//whatver short has appeared to be investigated, and the device to be atleast
//power cycled

module top_commutation(
	input wire start, //start pin from MCU, START IS ON THE SW
	input wire [2:0] shorts, //Short pin from MCU
	input wire [5:0] DesiredLoad, //Desired load for each phase from MCU AABBCC
	output reg [17:0] Sout, //OUTPUT 
	output wire shorted  //OUTPUT to MCU
);

//ADC WIRING
wire locked;
wire PLLOut;
reg ValidCommand;//DONE
wire clk;//55MHz Internal Oscillator
	
reg _short;
reg _rst;
wire [2:0] _CURRSIGNS;
reg  [2:0] CURRSIGNS;
wire [17:0] _Sout; //output to be ANDed with Short output
assign shorted = _short; //TODO TEST CASES

InternalClock u0 ( //55MHz Clock
	.oscena (1), // oscena.oscena
	.clkout (clk)  // clkout.clk
);



adc_threshold_monitor T1(
    clk,
    _rst,                      // Active-low reset
    _CURRSIGNS      // Output bits: 3 bits for each ADC channel (1 = exceeded)
);


FSM PhaseA(
	clk,
	_rst,
	DesiredLoad[5:4],
	CURRSIGNS[2],
	_Sout[17:12]);

FSM PhaseB(
	clk,
	_rst,
	DesiredLoad[3:2],
	CURRSIGNS[1],
	_Sout[11:6]);

FSM PhaseC(
	clk,
	_rst,
	DesiredLoad[1:0],
	CURRSIGNS[0],
	_Sout[5:0]);

initial begin
	_short <= 0;
	CURRSIGNS <= 0;
	_rst <= 0;
	Sout <= 18'b0;
	end

always @(posedge clk) begin
	if(shorts) begin _short = 1; end
end

always @(posedge clk) begin
	CURRSIGNS <= _CURRSIGNS;
end


always @(posedge clk) begin
	_rst = !start;
end

always @(posedge clk) begin
	Sout <= _short ? 18'b0 : _Sout;
end


endmodule
