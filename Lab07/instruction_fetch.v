module Instruction_Fetch(
	input clk, reset,
	output [31:0] instruction
);
reg [63:0] b;
wire [63:0] out;
wire [63:0] PC_Out;


Program_Counter pc0(
	.PC_In(out),
	.PC_Out(PC_Out),
	.clk(clk),
	.reset(reset)
);

Adder a0(
	.a(PC_Out),
	.b(b),
	.out(out)
);

Instruction_Memory im0(
	.Inst_Address(PC_Out),
	.instruction(instruction)
);
initial
	b = 64'd4;

endmodule