module Jump_Address (shift_in, PCOut, JumpAdd);
	input [25:0] shift_in;
	input [3:0] PCOut;
	output [31:0] JumpAdd;
	assign JumpAdd[27:0]={PCOut,2'b00,shift_in[25:0],2'b00};
endmodule
