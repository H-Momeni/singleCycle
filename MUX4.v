
module Mux4 (PCout, Add_ALUOut, AndGateOut, PCin1);

	input [31:0] PCout, Add_ALUOut;
	input AndGateOut;	
	
	output reg [31:0] PCin1;
	
	initial begin
		PCin1 <= 0;
	end
	
	always @(*) begin
		case (AndGateOut)
			0: PCin1 <= PCout ;
			1: PCin1 <= Add_ALUOut;
		endcase
	end
endmodule