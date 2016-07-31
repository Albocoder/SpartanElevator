//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gunduz Huseynli
// 
// Create Date:    11/25/2015 
// Design Name: 
// Module Name:    Queue
// Project Name: Spartan Elevator
//////////////////////////////////////////////////////////////////////////////////
module driverModuleCtrl(input clk,slowclk, input sg, input [3:0] cs, des, output reg [3:0] nes, output[3:0] out);
	reg on, dir;
	initial begin
		on <= 0;
		dir <= 0;
	end
	always @ ( posedge slowclk )
		
		if(sg) begin
			if(des > cs && des != 4'b1111) begin
				case ( cs ) 
					4'b0001: nes <= 4'b0010;
					4'b0010: nes <= 4'b0100;
					4'b0100: nes <= 4'b1000;
				endcase
				on <= 1;
				dir <= 1;
			end
			else if (cs > des)begin
				case ( cs ) 					
					4'b0010: nes <= 4'b0001;
					4'b0100: nes <= 4'b0010;
					4'b1000: nes <= 4'b0100;
				endcase
				on <= 1;
				dir <= 0;
			end
			else
				on <= 0;
		end
			
		else begin
			nes <= cs;
			on <= 0;
		end 
		
		DriverModuler dm(clk,on,dir,2'b11,out);
endmodule 