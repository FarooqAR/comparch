module tb();

wire Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;
reg [6:0] opcode;

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

initial
begin
opcode = 7'b0110011;
#15 opcode = 7'b0000011;
#15 opcode = 7'b0100011;
#15 opcode = 7'b1100011;
end

endmodule;