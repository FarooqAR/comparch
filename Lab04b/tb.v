module tb();

reg [63:0] Inst_Address;
wire [31:0] Instruction;
wire [63:0] readData1;
wire [63:0] readData2;
reg clk, reset;

Instruction_Memory im0(
	.Inst_Address(Inst_Address),
	.Instruction(Instruction)
);
 
top t0(
	.instruction(Instruction),
	.readData1(readData1),
	.readData2(readData2),
	.clk(clk),
	.reset(reset)
);
always
begin
#10	clk = ~clk;
end

initial
begin
	clk = 1;
	Inst_Address = 64'd0;
	#50 Inst_Address = 64'd4;
end

endmodule