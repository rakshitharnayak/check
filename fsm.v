`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:20:02 04/05/2023 
// Design Name: 
// Module Name:    updown 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module updown_counter
(
    input  clk,
    input  rst_n,
    input  up_down,
    output  [6:0] count,
	 reg [1:0] state,
	 input start, input stop, input load,
	//  input [7:0] decimal,
    output [7:0] bcd,
	 output reg [6:0] seg1,
    output reg [6:0] seg2
);
 reg [6:0] count_reg;
localparam IDLE = 2'b00;
localparam COUNT_UP = 2'b01;
localparam COUNT_DOWN = 2'b10;
localparam STOP = 2'b11;

initial begin 
state = IDLE;
count_reg <= 7'd0;
end





   
reg [3:0] digit1, digit2;  //rem and quo

    always@(posedge clk or posedge rst_n)
    begin
	     if (up_down)
		 begin
		 
          if(rst_n) begin
			  
          state<=IDLE;
         count_reg <= 7'd0;
          end
			 else if(load) begin
			 state <=IDLE;
			 count_reg <= 7'd90;
			 end
			 
			 //case start
          case(state) 
          IDLE: begin    //cae1
          if(start) begin
			 state<=COUNT_UP;
			 count_reg<=count;
         end			 
				else if(stop) begin
				state<=STOP;
				count_reg<=count;
             end
				 end //idle
				 
             COUNT_UP: begin   //case2
				 if(stop) begin
				 state<=IDLE; 
				 
				 end
				 
				 else if(start) begin
				count_reg<=count_reg+1;
				 end 
				 else
		 if( count_reg == 7'd99)
		 begin 
		 count_reg <= 7'd0;
		 end
				
				 end // countup
				   STOP : begin   //case3
				state<= IDLE;
				count_reg<= count_reg+0;
				end
				
				endcase
				 end //updown
				 
        else  
			begin
			 if(rst_n) begin
          
			 state<=IDLE;
			 count_reg <= 7'd99;
                    end
			 
			 else if(load) begin
			 state <=IDLE;
			 count_reg <= 7'd10;
			 end
			 
          case(state) 
          IDLE: begin     //case1
          if(start) begin
			 state<=COUNT_DOWN;
			 count_reg<=count; 
			 end
				else if(stop) 
				begin
				state<=STOP;
				count_reg<=count;
             end
				 end 
				 
             COUNT_DOWN: begin   //case2
				
		 
				if(stop) begin
				 state<=IDLE;
				 end
            else if(start) 
				begin		

            count_reg <= count_reg -1;	
if( count_reg == 7'd99)
		 begin 
		 count_reg <= 7'd0;
		 end				
    end 
	 
	 
	  
	 end   //end of case2
	 
	 
	         STOP : begin         //case3
				state<= IDLE;
				count_reg<= count_reg+0;
	 end
	 endcase
	 
	 
	 end
	 end
    assign count = count_reg;
	 
	

//assign bcd = {digit2, digit1}; //assign bcd=quo rem
endmodule

