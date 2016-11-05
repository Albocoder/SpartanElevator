# SpartanElevator
This is an elevator system with hardware queue made all in Verilog using Xilinx ISE. It was designed for Basys and 7 segment display, 4x4 push-button matrix, step motor with 4 stages.
The queue is made up of 4 slots and there are 4 buttons (one for each floor). 
The rule is FIFO and the queue is smart to delete any entry from initial position to first destination 
(If elevator is at 0 and was requested at 3 first then 2 it will go up to reach 3rd floor but will stop once at 2nd floor then delete 2 from queue then go towards 3rd floor)
