
module PC(clock, reset, PCin, PCout);

	input clock, reset;
	input [15:0] PCin;
	
	output reg [15:0] PCout;
	
	always @(posedge clock) begin
		if (reset == 1) 
			PCout <= 0;
		else 
			PCout <= PCin + 1; 
	end
endmodule