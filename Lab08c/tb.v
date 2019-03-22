module tb();

reg [6:0] opcode;
wire [3:0] Operation;
reg [3:0] Funct;

top t0(
	.opcode(opcode),
	.Operation(Operation),
	.Funct(Funct)
);

initial
begin

opcode = 7'b0110011;
Funct = 4'b0000;
#10 Funct = 4'b1000;
#10 Funct = 4'b0111;
#10 Funct = 4'b0110;
#15 opcode = 7'b0000011;
#15 opcode = 7'b0100011;
#15 opcode = 7'b1100011;


end

endmodule;