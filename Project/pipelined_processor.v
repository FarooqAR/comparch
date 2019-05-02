module pipelined_processor (
	input clk,    // Clock
	input reset,  // Asynchronous reset active low
);

	//Wires
	wire pc_select; //pc_mux
	wire [63:0] pc_default_out; //pc_mux
	wire [63:0] pc_branch_out; //pc_mux
	wire [63:0] pc_mux_out; //pc_mux
	wire [63:0] PC_Out;
	wire [31:0] instruction;
	wire [31:0] if_id_Instruction_Out;
	wire [63:0] if_id_Inst_Addr_Out;
	wire [6:0] opcode;
	wire [4:0] id_rs1;
	wire [4:0] id_rs2;
	wire [4:0] id_rd;
	wire [2:0] funct3; 
	wire [6:0] funct7; 
	wire [3:0] Funct;
	wire [63:0] readData1;
	wire [63:0] readData2;
	wire [63:0] imm_data;
	wire Branch, RegWrite, MemRead, MemToReg, MemWrite, ALUSrc;
	wire [1:0] ALUOp;
	wire [63:0] id_ex_Inst_Addr_Out;
	wire [4:0] ex_rs1;
	wire [4:0] ex_rs2;
	wire [4:0] ex_rd;
	wire [63:0] ex_readData1;
	wire [63:0] ex_readData2;
	wire [63:0] ex_imm_data;
	wire [3:0] ex_Funct;
	wire [1:0] ex_WB_out;
	wire [2:0] ex_M_out;
	wire ex_ALUSrc;
	wire [1:0] ex_ALUOp;

	//assignments
	assign Funct = {if_id_Instruction_Out[30], if_id_Instruction_Out[14:12]};
	
	//Modules
		//Instruction Fetch
	mux pc_mux(
	.sel(pc_select), 
	.a(pc_branch_out), 
	.b(pc_default_out),
	.data_out(pc_mux_out)
	);

	Program_Counter pc0(
	.PC_In(pc_mux_out),
	.PC_Out(PC_Out),
	.clk(clk),
	.reset(reset)
	);

	Adder pc_default_adder(
		.a(PC_Out),
		.b(64'd4),
		.out(pc_default_out)
	);

	Instruction_Memory im0(
	.Inst_Address(PC_Out),
	.instruction(instruction)
	);

	IF_ID if_id
	(
		.clk(clk),
		.Instruction(instruction),
		.Inst_Addr(PC_Out),
		.Instruction_Out(if_id_Instruction_Out),
		.Inst_Addr_Out(if_id_Inst_Addr_Out)
	);

		//Instruction Decode
	InstructionParser ip0 (
	.opcode(opcode),
	.instruction(if_id_Instruction_Out),
	.rs1(id_rs1),
	.rs2(id_rs2),
	.rd(id_rd),
	.funct3(funct3),
	.funct7(funct7)
	);

	registerFile rf(
	.WriteData(WriteData), //HOLD
	.rs1(id_rs1),
	.rs2(id_rs2),
	.rd(id_rd),
	.readData1(readData1),
	.readData2(readData2),
	.RegWrite(RegWrite), //HOLD
	.clk(clk),
	.reset(reset)
	);

	ImmDataExtractor ide0(
	.instruction(if_id_Instruction_Out),
	.imm_data(imm_data)
	);

	Control_Unit cu(
	.opcode(opcode),
	.Branch(Branch),
	.ALUOp(ALUOp),
	.RegWrite(RegWrite),
	.MemRead(MemRead),
	.MemToReg(MemToReg),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc)
	);


	ID_EX id_ex
	(
		.clk(clk),
		.Inst_Addr(if_id_Inst_Addr_Out),
		.Inst_Addr_Out(id_ex_Inst_Addr_Out),
		.rs1(id_rs1),
		.rs1_Out(ex_rs1),
		.rs2(id_rs2),
		.rs2_Out(ex_rs2),
		.rd(id_rd),
		.rd_Out(ex_rd),
		.ReadData1(readData1),
		.ReadData1_Out(ex_readData1),
		.ReadData2(readData2),
		.ReadData2_Out(ex_readData2),
		.ImmediateData(imm_data),
		.ImmediateData_Out(ex_imm_data),
		.Funct_Instruction(Funct),
		.Funct_Out(ex_Funct)
		.WB({RegWrite, MemToReg}),
		.WB_Out(ex_WB_out),
		.M({Branch, MemWrite, MemRead}),
		.M_Out(ex_M_out),
		.EX({ALUSrc, ALUOp}),
		.ALUOp(ex_ALUOp),
		.ALUSrc(ex_ALUSrc)
	);

	//EX/MEM
	EX_MEM ex_mem
	(
		.clk(clk),
		.WB(),
		.WB_Out(),
		.M(),
		.Branch(),
		.MemWrite(),
		.MemRead(),
		.Adder_Result(),
		.Adder_Result_Out(),
		.ALU_Zero(),
		.ALU_Zero_Out(),
		.ALU_Result(),
		.ALU_Result_Out(),
		.Forward_B_Mux_Result(),
		.Forward_B_Mux_Result_Out(),
		.rd(),
		.rd_out()
	);

	//MEM/WB
	MEM_WB MEM_WB
	(
		.clk(clk),
		.WB(),
		.Mem_to_Reg(),
		.Reg_Write(),
		.Read_Data(),
		.Read_Data_out(),
		.rd(),
		.rd_out(),
		.Mem_Address(),
		.Mem_Address_out()
	);
	
endmodule