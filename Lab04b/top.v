module top(
	input [31:0] instruction,
	output [63:0] readData1,
	output [63:0] readData2,
	input clk, reset
);

reg RegWrite;
wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7; 

InstructionParser ip0(
	.rs1(rs1),
	.rs2(rs2),
	.rd(rd),
	.opcode(opcode),
	.funct3(funct3),
	.funct7(funct7),
	.instruction(instruction)
);

registerFile rf0(
	.WriteData(),
	.rs1(rs1),
	.rs2(rs2),
	.rd(rd),
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWrite),
	.readData1(readData1),
	.readData2(readData2)
);

endmodule