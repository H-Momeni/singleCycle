
module ALUControl(Opcode, ALUOp1, ALUOp0, Funct, Operation);
	input ALUOp1, ALUOp0;
	input [5:0] Funct, Opcode;
	output [3:0] Operation;
	reg [3:0] Operation;

	always @ (ALUOp1, ALUOp0, Funct) begin
		if((ALUOp1==1'b0)&(ALUOp0==1'b0)) begin
			Operation <= 3'b010;
		end

		if(ALUOp0==1'b1) begin
			Operation <= 4'b0110;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b0)&(Funct[1]==1'b0)&(Funct[2]==1'b0)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b0010;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b0)&(Funct[1]==1'b1)&(Funct[2]==1'b0)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b0110;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b0)&(Funct[1]==1'b0)&(Funct[2]==1'b1)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b0000;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b1)&(Funct[1]==1'b0)&(Funct[2]==1'b1)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b0001;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b0)&(Funct[1]==1'b1)&(Funct[2]==1'b0)&(
		Funct[3]==1'b1)) begin
			Operation <= 4'b0111;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b1)&(Funct[1]==1'b1)&(Funct[2]==1'b1)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b1100;
		end

		if((ALUOp1==1'b1)&(Funct[0]==1'b0)&(Funct[1]==1'b1)&(Funct[2]==1'b1)&(
		Funct[3]==1'b0)) begin
			Operation <= 4'b0011;
		end

		if(Opcode==6'b001000) begin //for add immediate
			Operation <= 4'b0010;
		end

		if(Opcode==6'b001101) begin //for or immediate
			Operation <= 4'b0001;
		end

		if(Opcode==6'b001100) begin // for andi
			Operation <= 4'b0000;
		end

		if(Opcode==6'b001010) begin // for slti
		Operation <= 4'b0111;
		end
	end
endmodule