module tb();

reg [63:0] Inst_Address;
wire [31:0] instruction;

Instruction_Memory im0(
	.instruction(instruction),
	.Inst_Address(Inst_Address)
);

initial
begin
	Inst_Address = 64'd0;
	#50 Inst_Address = 64'd4;
end

endmodule