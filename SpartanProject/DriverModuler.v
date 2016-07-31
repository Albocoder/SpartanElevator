`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Erin Avllazagaj
// Create Date:    17:14:28 12/19/2015 
// Module Name:    driverModule 
//
//////////////////////////////////////////////////////////////////////////////////
module DriverModuler(
    input clk,
    input start,
    input dir,
    input [1:0] speed ,
    output [3:0] out
    );
	 
	 reg countReached = 0;
	 integer counter = 0;
	 reg[23:0] targetCount = 24'b10011000100101101000000;
	 


	//Determine Speed	and Change targetCount
	always @ (posedge clk ) 
		case ( speed ) 
			2'b00: targetCount = 24'b11111111111111111111111; //Always 1, no posedge
			2'b01: targetCount = 24'b10011000100101101000000; // Frequency : 10Hz
			2'b10: targetCount = 24'b1001100010010110100000; // Frequency : 20 Hz
			2'b11: targetCount = 24'b000110001001011010000; //Frequency : 40 Hz
		endcase
	 
	 //Counter Loop
	 	always @ ( posedge clk ) 
		if ( counter == targetCount) begin
					counter <= 0;
					countReached <= 1;
					end
		else begin counter <= counter +1;
						countReached <= 0;			
		end
		
		//Start MotorDriver
		motorDriver motor ( countReached, ~start, dir, out );

endmodule
