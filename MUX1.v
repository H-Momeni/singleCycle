module Mux1(a, b, RegDst, WriteReg);

	input [4:0] a;
	input [4:0] b;
	input RegDst;
	
	output reg [4:0] WriteReg;

	always @ (RegDst, a, b) begin
		case(RegDst) 
			0 : WriteReg <= a;
			1 : WriteReg <= b;
		endcase
	end
endmodule
