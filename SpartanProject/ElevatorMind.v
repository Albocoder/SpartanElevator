`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Erin Avllazagaj
// 
// Create Date:    11/25/2015 
// Design Name: 
// Module Name:    Queue
// Project Name: Spartan Elevator
//////////////////////////////////////////////////////////////////////////////////
module Queue(input clk, slowclk, one,input[3:0] cs, output[3:0] currstat,des,input[3:0]keycode, output reg go);
	reg[3:0] currSt = 4'b1,queueItem1 = 4'b1111,queueItem2 = 4'b1111,queueItem3 = 4'b1111,queueItem4 = 4'b1111;
	
	//continuous assignment
	assign currstat = currSt;
	assign des = queueItem1;
	
	always@(negedge clk) begin
		
		//adds new key pressed to queue
		if(keycode == 4'b0010 || keycode == 4'b0100 || keycode == 4'b1000)begin
			if(queueItem1 != keycode && queueItem2 != keycode && queueItem3 != keycode && queueItem4 != keycode)begin
				if(queueItem1 == 4'b1111 && queueItem2 == 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem1 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 == 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem2 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 != 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem3 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 != 4'b1111 && queueItem3 != 4'b1111 && queueItem4 == 4'b1111)
					queueItem4 <= keycode;
				//else don't add the new one in the queue
			end
			//else if any of the slots is equal the keycode then dont add it
		end
		else if(keycode == 4'b0001)begin
			if(one)begin 
				if(queueItem1 != keycode && queueItem2 != keycode && queueItem3 != keycode && queueItem4 != keycode)begin
				if(queueItem1 == 4'b1111 && queueItem2 == 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem1 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 == 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem2 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 != 4'b1111 && queueItem3 == 4'b1111 && queueItem4 == 4'b1111)
					queueItem3 <= keycode;
				else if(queueItem1 != 4'b1111 && queueItem2 != 4'b1111 && queueItem3 != 4'b1111 && queueItem4 == 4'b1111)
					queueItem4 <= keycode;
				end
			end
		end
		
		
		//check if current state matches with the request queue
		if(currSt == 4'b1000 || currSt == 4'b0100 || currSt == 4'b0010 || currSt == 4'b0001)begin
			if(queueItem1 == currSt)begin
				queueItem1 <= queueItem2;
				queueItem2 <= queueItem3;
				queueItem3 <= queueItem4;
				queueItem4 <= 4'b1111;
				go = 0;
			end
			else if (queueItem2 == currSt)begin
				queueItem2 <= queueItem3;
				queueItem3 <= queueItem4;
				queueItem4 <= 4'b1111;
				go = 0;
			end
			else if (queueItem3 == currSt)begin
				queueItem3 <= queueItem4;
				queueItem4 <= 4'b1111;
				go = 0;
			end
			else if(queueItem4 == currSt)begin
				queueItem4 <= 4'b1111;
				go = 0;
			end
			//if current state is not in the request queue
			else 
				go = 1;
		end
	end
	always@(posedge slowclk)
		currSt <= cs;

endmodule
