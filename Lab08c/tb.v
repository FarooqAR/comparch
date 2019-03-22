module tb();

wire Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;
reg [6:0] opcode;
wire [3:0] Operation;
reg [3:0] Funct;

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
initial
begin

opcode = 7'b0110011;
Funct = 4'b0000;
#10 Funct = 4'b1000;
#10 Funct = 4'b0111;
#10 Funct = 4'b0110;
#15 opcode = 7'b0000011;
Funct = 4'bxxxx;
#15 opcode = 7'b0100011;
#15 opcode = 7'b1100011;


end

endmodule;