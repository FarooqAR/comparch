module tb();

wire [31:0] instruction;
reg clk, reset;

Instruction_Fetch if0(
	.clk(clk),
	.reset(reset),
	.instruction(instruction)
);

always
#10 clk = ~clk;

initial
begin
	clk = 0;
	reset = 0;
end

endmodule