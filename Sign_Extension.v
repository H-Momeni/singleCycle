
module Sign_Extension (sign_in, sign_out);
	input [5:0] sign_in;
	output [15:0] sign_out;
	assign sign_out[5:0]=sign_in[5:0];
	assign sign_out[15:6]=sign_in[5]?10'b1111111111:10'b0;
endmodule