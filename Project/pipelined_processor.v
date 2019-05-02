module pipelined_processor (
	input clk,    // Clock
	input rst,  // Asynchronous reset active low
);
	//IF/ID
	IF_ID if_id
	(
		.clk(clk),
		.Instruction(),
		.Inst_Addr(),
		.Instruction_Out(),
		.Inst_Addr_Out()
	);
	//ID/EX
	ID_EX id_ex
	(
		.clk(clk),
		.Inst_Addr(),
		.Inst_Addr_Out(),
		.rs1(),
		.rs1_Out(),
		.rs2(),
		.rs2_Out(),
		.rd(),
		.rd_Out(),
		.ReadData1(),
		.ReadData1_Out(),
		.ReadData2(),
		.ReadData2_Out(),
		.ImmediateData(),
		.ImmediateData_Out(),
		.Instruction(),
		.Funct()
		.WB(),
		.WB_Out(),
		.M(),
		.M_Out(),
		.EX(),
		.ALUOp(),
		.ALUSrc()
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