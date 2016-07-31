//////////////////////////////////////////////////////////////////////////////////
// Engineer: Erin Avllazagaj
// 
// Create Date:    12/19/2015 
// Design Name: 
// Module Name:    Queue
// Project Name: Spartan Elevator
//////////////////////////////////////////////////////////////////////////////////
module SevenSegment(input clk, input [3:0] keycode,output reg CA,CB,CC,CD,CE,CF,CG, output AN0,AN1,AN2,AN3);
	//using only 1 digit(anode)
	assign {AN0,AN1,AN2,AN3} = 4'b1110;
	
	always@(posedge clk) begin
		//1
		if(keycode == 8'b0001)
			{CA,CB,CC,CD,CE,CF,CG} = 7'b1001111;
		
		//2
		else if(keycode == 8'b0010)
			{CA,CB,CC,CD,CE,CF,CG} = 7'b0010010;
		
		//3
		else if(keycode == 8'b0100)
			{CA,CB,CC,CD,CE,CF,CG} = 7'b0000110;
		
		//4
		else if(keycode == 8'b1000)
			{CA,CB,CC,CD,CE,CF,CG} = 7'b1001100;
	end
endmodule 