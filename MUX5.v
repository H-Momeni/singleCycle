
module Mux5 (PCin1, PCin2, Jump, PCin);

	input [31:0] PCin1, PCin2;
	input Jump;	
	
	output reg [31:0] PCin;
	
	initial begin
		PCin <= 0;
	end
	
	always @(*) begin
		case (Jump)
			0: PCin <= PCin1 ;
			1: PCin <= PCin2;
		endcase
	end
endmodule
