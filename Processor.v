module process(input clk, reset);
	//PC
	wire [15:0] PCin, PCout;
	PC pc(.clock(clk), .reset(reset), .PCin(PCin), .PCout(PCout));

	//instrcton_memory
	wire [15:0] inst;
	IMemBank imembank(.memread(1), .address(PCin), .readdata(inst));
	
	//ControlUnit
	wire [1:0] reg_dst, mem_to_reg, alu_op;
	wire jump, beq, bne, mem_read, mem_write, alu_src, reg_write;
	Control control( 
		.opcode(inst[15:12]),
		.reg_dst(reg_dst),
		.mem_to_reg(mem_to_reg),
		.alu_op(alu_op),
		.jump(jump),
		.beq(beq),
		.bne(bne),
		.mem_read(mem_read),
		.mem_write(mem_write),
		.alu_src(alu_src),
		.reg_write(reg_write));
	//write_reg_MUX
	wire [4:0] writeReg;
	Mux1 mux1(.a(inst[20:16]), .b(inst[15:11]), .RegDst(reg_dst), .WriteReg(writeReg));
	
	// RegFile
	wire [31:0] readData1, readData2 , WriteDataReg;
	RegFile regfile(
		.clk(clk),
		.readreg1(inst[25:21]),
		.readreg2(inst[20:16]),
		.writereg(writeReg),
		.RegWrite(reg_write),
		.writedata(WriteDataReg),
		.readdata1(readData1),
		.readdata2(readData2));
	// Sign_extend
	wire [31:0] extend;
	Sign_Extension SE( .sign_in(inst[15:0]), .sign_out(extend));
	
	// Alu_Src_Mux
	wire [31:0] data2;
	Mux2 mux2( .readData2(readData2), .extend(extend), .alu_src(alu_src), .data2(data2));
	
	// Shift_Left_Jump
	//wire [31:0] ShiftOut;
	//ShiftLeft2 ShiftLeft(
		//.ShiftIn(extend),
		//.ShiftOut(ShiftOut));

	// ALUControl
	wire [3:0] ALUCtl;
	ALUControl alu_cnt(
		.Opcode(alu_op),
		.Funct(inst[5:0]),
		.ALUOp0(alu_op[0]),
		.ALUOp1(alu_op[1]),
		.Operation(ALUCtl));

	// ALU
	wire Zero, Lt, Gt;
	wire [31:0] ALUOut;
	ALU alu(
		.data1(readData1),
		.data2(data2),
		.aluoperation(ALUCtl),
		.result(ALUOut),
		.zero(Zero),
		.lt(Lt),
		.gt(Gt));

	//Add_ALU
	wire [31:0] Add_ALUOut;
	Add_ALU add_alu(
			.PCout(PCout),
			.ShiftOut(extend),
			.Add_ALUOut(Add_ALUOut));

	//And_Gate
	wire AndGateOut;
	And and_gate( .Branch(beq), .Zero(Zero), .AndGateOut(AndGateOut));

	// PC_Src_Mux1
	wire [31:0] PCin1;
	Mux4 mux4( 
		.PCout(PCout),
		.Add_ALUOut(Add_ALUOut),
		.AndGateOut(AndGateOut), 
		.PCin1(PCin1));
	
	// Jump_Address
	wire [31:0] PCin2;
	Jump_Address jump_address(
				.shift_in(inst[25:0]),
				.PCOut(PCout),
				.JumpAdd(PCin2));
	
	// PC_Src_Mux2
	Mux5 mux5(
		.PCin1(PCin1),
		.PCin2(PCin2),
		.Jump(jump),
		.PCin(PCin));

	// Data_Memory
	wire [31:0] ReadData;
	DMemBank dataMem(
			.memread(mem_read),
			.memwrite(mem_write),
			.address(ALUOut),
			.writedata(readData2),
			.readdata(ReadData));

	// Mem_To_Reg_Mux
	Mux3 mux3(
		.ReadData(ReadData),
		.ALUOut(ALUOut),
		.MemtoReg(mem_to_reg[0]),
		.WriteDataReg(WriteDataReg));
endmodule
	
