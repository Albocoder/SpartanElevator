`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    motorDriver module
//*********************************************
// Engineers: Erin Avllazagaj/Gunduz Hyseyinli
//*********************************************
// 1 = clockwise, 0 = CounterClockwise
//////////////////////////////////////////////////////////////////////////////////
module motorDriver(
    input clk,
	 input reset,
	 input direction, // 1 will stand for clockwise, 0 for CC
    output reg [3:0] out
    );
	 
	 reg [1:0] state , nextState;
	 
	 //Parameters 
	 parameter S0 = 2'b00;
	 parameter S1 = 2'b01;
	 parameter S2 = 2'b10;
	 parameter S3 = 2'b11;
	 
	 //State Register
	 always @(posedge clk, posedge reset)
	 if (reset) state <= S0;
	 else state <= nextState;
	 
	 //next State Logic:  Move to next upper state ( S0 -> S1 ) if clockwise, next lower state (S1 -> S0) if CC
	 always @ (*) 
		case ( state )
			S0: if (direction) nextState = S1;
				 else nextState = S3;
			S1: if (direction) nextState = S2;
				 else nextState = S0;
			S2: if (direction) nextState = S3;
				 else nextState = S1;
			S3: if (direction) nextState = S0;
				 else nextState = S2;				 
			default: nextState = S0;
		endcase
			
	//output logic 
	// Outputs the respective signal for each state as follwing
	// S0: 1010   S1: 0110   S2: 0101   S3: 1001
	always @ (*) 
		case (state) 
			S0: out = 4'b1010;
			S1: out = 4'b0110;
			S2: out = 4'b0101;
			S3: out = 4'b1001;
			default: out = 4'b1010;
		endcase
endmodule