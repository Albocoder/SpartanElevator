//////////////////////////////////////////////////////////////////////////////////
// Engineer: Erin Avllazagaj
// 
// Create Date:    11/25/2015 
// Design Name: 
// Module Name:    Queue
// Project Name: Spartan Elevator
//////////////////////////////////////////////////////////////////////////////////
module counter(input clk,input start, input[27:0] stateToGo ,output reg finished);
	reg [27:0]state = 0;
	reg [27:0]nextState = 0;
	//state register
	always@(posedge clk)begin
		state <= nextState;
	end
	//output CL
	always@(posedge clk)begin
		if (start == 1)begin
			if(state == stateToGo)
				finished = 1;
			else 
				finished = 0;
		end
	end
	//next state CL
	always@(posedge clk)begin
		if(start == 1)begin
			if(state == stateToGo)
				nextState = 0;
			else
				nextState = state + 1;
		end
	end
endmodule 