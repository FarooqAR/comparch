module top(
	input [6:0] opcode,
	input [3:0] Funct,
	output [3:0] Operation
);
wire Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;

Control_Unit cu0 (
	.opcode(opcode),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemToReg(MemToReg),
	.ALUOp(ALUOp),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite)
);

ALU_Control ac0 (
	.ALUOp(ALUOp),
	.Funct(Funct),
	.Operation(Operation)
);
endmodule