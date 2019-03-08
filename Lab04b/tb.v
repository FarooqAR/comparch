module tb();

reg [31:0] Instruction;
wire [63:0] readData1;
wire [63:0] readData2;
reg clk, reset;
 
top t0(
	// inputs
	.instruction(Instruction),
	.clk(clk),
	.reset(reset),
	// outputs
	.readData1(readData1),
	.readData2(readData2)
);
always
begin
#10	clk = ~clk;
end

initial
begin
	clk = 1;
	reset = 0;
	Instruction = 32'b1111111_00010_00011_111_00011_1111111;
	#20
	Instruction = 32'b1111111_00100_00101_111_00011_1111111;
	#20
	Instruction = 32'b1111111_00110_00111_111_00011_1111111;
end

endmodule