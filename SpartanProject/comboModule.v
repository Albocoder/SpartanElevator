//////////////////////////////////////////////////////////////////////////////////
// Engineer: Erin Avllazagaj
// 
// Create Date:    12/19/2015 
// Design Name: 
// Module Name:    Queue
// Project Name: Spartan Elevator
//////////////////////////////////////////////////////////////////////////////////
module comboModule(input clk,one,input [3:0]col,output [3:0] row, output CA,CB,CC,CD,CE,CF,CG,AN0,AN1,AN2,AN3,output [3:0]kCode,out,des);
	wire wait100,clock3s;
	wire [3:0]nsWire,csWire;
	keyboardScanner scanner(wait100,col,row,kCode);
	counter msClock(clk,1,28'd500000,wait100);
	counter sClock(clk,1,28'd50000000,clock3s);
	SevenSegment SS(clk,csWire,CA,CB,CC,CD,CE,CF,CG,AN0,AN1,AN2,AN3);
	driverModuleCtrl theArm(clk,clock3s,go,csWire,des,nsWire,out);
	Queue theBrain(clk,clock3s,one,nsWire,csWire,des,kCode,go);
endmodule 