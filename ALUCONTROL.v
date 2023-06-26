module ALUControl(AluOp, Funct, Operation);
	input [2:0] AluOp
	input [2:0] Funct;
	output reg[3:0] Operation;
	wire [5:0] ALUControlIn;  
 	assign ALUControlIn = {ALUOp,Funct};  

	 always @(ALUControlIn)  
		casex (ALUControlIn)  
		6'b001xxx:  Operation=4'b0000; //jump,reset,lhw,shw,addi->add 
		6'b010xxx:  Operation=4'b0010; //andi->and
		6'b011xxx:  Operation=4'b0011; //ori->or
		6'b100xxx:  Operation=4'b0001; //subi->sub
		6'b101xxx:  Operation=4'b0001; //beq,bne,blt,bgt->sub
		6'b000000:  Operation=4'b0000; //add
		6'b000001:  Operation=4'b0001; //sub
		6'b000010:  Operation=4'b0010; //and
		6'b000011:  Operation=4'b0011; //or
		6'b000100:  Operation=4'b0100; //xor
		6'b000101:  Operation=4'b0101; //nor
		6'b000110:  Operation=4'b0110; //slt

		//default:  Operation=4'b0000;  
  		endcase
endmodule