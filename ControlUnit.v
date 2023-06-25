//ehtemalan ye blt va bgt niaz hast
module Control(input[3:0] opcode, input reset,  output reg[1:0]reg_dst, mem_to_reg, alu_op,
		output reg jump, beq, bne, mem_read, mem_write, alu_src, reg_write);

always@(opcode, reset) begin
	if(reset == 1'b1)begin
		reg_dst = 2'b00;  //?
		mem_to_reg = 2'b00;  //?
		alu_op = 2'b00; //jaye alu op1 va 2 4 bit mizarim
		jump = 1'b0;
		beq = 1'b0; //*
		bne = 1'b0; //*
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;
	end
	else begin
	case(opcode)
	4'b0000: begin //R-Type
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
	4'b0001: begin //addi
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00; //chea 00 vali ori 11
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	4'b0111: begin //lhw
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
	4'b1000: begin //shw
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
	4'b1001: begin //beq
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
	4'b1010: begin //bne
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
	4'b1011: begin //blt*
	/*	reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b01;
		jump = 1'b0;
		beq = 1'b1; //*
		bne = 1'b0; //*
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;*/
	end
	4'b1100: begin //bgt*
	/*	reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b01;
		jump = 1'b0;
		beq = 1'b1; //*
		bne = 1'b0;//* 
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b0;
		reg_write = 1'b0;*/
	end
	4'b1111: begin //jump
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
	4'b0100: begin //subi*
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b00; //chera 00 vali ori 11
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	4'b0010: begin //andi
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b11; //?
		jump = 1'b0;
		beq = 1'b0;
		bne = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		alu_src = 1'b1;
		reg_write = 1'b1;
	end
	4'b0011: begin //ori
		reg_dst = 2'b00;
		mem_to_reg = 2'b00;
		alu_op = 2'b11; //?
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

	 