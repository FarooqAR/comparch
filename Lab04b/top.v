module top(
	input [31:0] instruction,
	output reg [63:0] readData1,
	output reg [63:0] readData2,
	input clk, reset
);

reg RegWrite;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;

InstructionParser ip0(
	.rs1(rs1),
	.rs2(rs2),
	.rd(rd),
	.instruction(instruction)
);

registerFile rf0(
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