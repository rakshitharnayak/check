`timescale 1ns / 1ps
module test;

	// Inputs
	reg clk;
	reg rst_n;
	reg up_down;
	reg start;
	reg stop;
	reg load;

	// Outputs
	wire [6:0] count;

	// Instantiate the Unit Under Test (UUT)
	updown_counter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.up_down(up_down), 
		.count(count), 
		.start(start), 
		.stop(stop), 
		.load(load)
	);

	initial  clk=1'b0;
	always #5 clk=~clk;
	initial
    begin
        rst_n= 1;start=1;
		  
        #10;
        rst_n= 0;start =1;
    end
initial
    begin
        up_down = 1; // Set up_down to 1 for counting up
        #100;
		  start=0;stop=1;
		  #50;
		  start=1;stop=0;
		  #50;
		  rst_n=1; 
		  #50;
		  load=1;start=0;
		  #50;
		  load=0;
		  start=1; up_down=0;
		  #1000;
		  start=0;stop=1;
		  #50;
		  start=1;stop=0;
		  #50;
		  load=1;start=0;
		  #50;
		load=0; start=0; rst_n=1;
		#50;
        start=1; // Set up_down to 0 for counting down
        #20;
        $finish;
		// Add stimulus here

	end
      
endmodule
