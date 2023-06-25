module Control(input[5:0] opcode, input reset,  output reg[1:0]reg_dst, mem_to_reg, alu_op,
		output reg jump, beq, bne, mem_read, mem_write, alu_src, reg_write);

always@(opcode, reset) begin
	if(reset == 1'b1)begin
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;
	end
	else begin
	case(opcode)
	6'b000000: begin //R-Type
		reg_dst = 2'b01;
		mem_to_reg = 2'b00;
		alu_op = 2'b10;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b1;
	end
	6'b001000: begin //addi
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	6'b100011: begin //lw
		reg_dst = 2'b00;
		mem_to_reg = 2'b01;
		alu_op = 2'b00;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b1;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	6'b101011: begin //sw
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b1;
		alu_src = 1'b1;
		reg_write = 1'b0;
	end
	6'b000100: begin //beq
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b01;
		jump = 1'b0;
		beq = 1'b1;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;
	end
	6'b000101: begin //bne
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b01;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;
	end
	6'b000010: begin //jump
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00;
		jump = 1'b1;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;
	end
	6'b001010: begin //slti
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b11;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	6'b001100: begin //andi
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b11;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	6'b001101: begin //ori
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b11;
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	endcase
	end
  end

endmodule

	 