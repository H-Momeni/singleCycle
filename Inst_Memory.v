
//memory unit
module IMemBank(input memread, input [31:0] address, output reg [31:0] readdata);
 
  reg [31:0] mem_array [255:0];
  initial begin
    	 
	mem_array[0] = 32'b00100000000100000010011100001111;
	mem_array[1] = 32'b00100000000100010000000000000000;
	mem_array[2] = 32'b00100000000100100000000000000000;
	mem_array[3] = 32'b00100000000010000000000000000000;
	mem_array[4] = 32'b00100000000010010000000000000001;
	mem_array[5] = 32'b00000010010010000101000000100000;
	mem_array[6] = 32'b10101101010010010000000000000000;
	mem_array[7] = 32'b00100001000010000000000000000001;
	mem_array[8] = 32'b00100000000010010000000000000101;
	mem_array[9] = 32'b00000010010010000101000000100000;
	mem_array[10] = 32'b10101101010010010000000000000000;
	mem_array[11] = 32'b00100001000010000000000000000001;
	mem_array[12] = 32'b00100000000010011111111111111101;
	mem_array[13] = 32'b00000010010010000101000000100000;
	mem_array[14] = 32'b10101101010010010000000000000000;
	mem_array[15] = 32'b00100001000010000000000000000001;
	mem_array[16] = 32'b00100000000010010000000000000100;
	mem_array[17] = 32'b00000010010010000101000000100000;
	mem_array[18] = 32'b10101101010010010000000000000000;
	mem_array[19] = 32'b00100001000010000000000000000001;
	mem_array[20] = 32'b00100000000010010000000000000010;
	mem_array[21] = 32'b00000010010010000101000000100000;
	mem_array[22] = 32'b10101101010010010000000000000000;
	mem_array[23] = 32'b00100001000010000000000000000001;
	mem_array[24] = 32'b00100000000010010000000000000111;
	mem_array[25] = 32'b00000010010010000101000000100000;
	mem_array[26] = 32'b10101101010010010000000000000000;
	mem_array[27] = 32'b00100001000010000000000000000001;
	mem_array[28] = 32'b00100000000010010000000000001000;
	mem_array[29] = 32'b00000010010010000101000000100000;
	mem_array[30] = 32'b10101101010010010000000000000000;
	mem_array[31] = 32'b00100001000010000000000000000001;
	mem_array[32] = 32'b00100000000010010000000000001001;
	mem_array[33] = 32'b00000010010010000101000000100000;
	mem_array[34] = 32'b10101101010010010000000000000000;
	mem_array[35] = 32'b00100001000010000000000000000001;
	mem_array[36] = 32'b00100000000010010000000000001010;
	mem_array[37] = 32'b00000010010010000101000000100000;
	mem_array[38] = 32'b10101101010010010000000000000000;
	mem_array[39] = 32'b00100001000010000000000000000001;
	mem_array[40] = 32'b00100000000010010000001111101000;
	mem_array[41] = 32'b00000010010010000101000000100000;
	mem_array[42] = 32'b10101101010010010000000000000000;
	mem_array[43] = 32'b00100001000010000000000000000001;
	mem_array[44] = 32'b00100000000010000000000000000000;
	mem_array[45] = 32'b00101001000010110000000000001010;
	mem_array[46] = 32'b00010001011000000000000000111001;
	mem_array[47] = 32'b00000001000100100100100000100000;
	mem_array[48] = 32'b10001101001010100000000000000000;
	mem_array[49] = 32'b00000001010100000101100000101010;
	mem_array[50] = 32'b00010001011000000000000000110011;
	mem_array[51] = 32'b00000000000010101000000000100000;
	mem_array[52] = 32'b00000010001010100101100000101010;
	mem_array[53] = 32'b00010001011000000000000000110110;
	mem_array[54] = 32'b00000000000010101000100000100000;
	mem_array[55] = 32'b00100001000010000000000000000001;
	mem_array[56] = 32'b00001000000000000000000000101100;
 end
     	

  always@(memread, address, mem_array[address])
  begin
    if(memread)begin
      readdata=mem_array[address];
    end
  end

endmodule
