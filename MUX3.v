
module Mux3 (ReadData, ALUOut, MemtoReg, WriteDataReg);

	input [31:0] ReadData, ALUOut;
	input MemtoReg;	
	
	output reg [31:0] WriteDataReg;
	
	always @(*) begin
		case (MemtoReg)
			0: WriteDataReg <= ALUOut ;
			1: WriteDataReg <= ReadData;
		endcase
	end
endmodule