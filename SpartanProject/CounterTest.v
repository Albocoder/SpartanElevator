`timescale 1ns/1ps
module CounterTest ( input clk , input[1:0] spd, output reg reached = 0) ;
	reg [21:0]  toGo = 22'd10011000100101101000000;
	integer counter = 0;
	
	
		always @ (spd ) 
		case ( spd ) 
			2'b00: toGo = 24'b0; //Always 1, no posedge
			2'b01: toGo = 24'b10011000100101101000000; // Frequency : 10Hz
			2'b10: toGo = 24'b1001100010010110100000; // Frequency : 20 Hz
			2'b11: toGo = 24'b100110001001011010000; //Frequency : 40 Hz
		endcase
		
		
	always @ ( posedge clk ) 
		if ( counter == toGo) begin
					counter = 0;
					reached = 1;
					end
		else begin counter = counter +1;
						reached = 0;			
		end
endmodule 