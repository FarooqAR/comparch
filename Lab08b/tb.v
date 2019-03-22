module tb();

reg [1:0] ALUOp;
wire [3:0] Operation;
reg [3:0] Funct;

ALU_Control ac0 (
	.ALUOp(ALUOp),
	.Funct(Funct),
	.Operation(Operation)
);
initial
begin

Funct = 4'b0000;
ALUOp = 2'b10;
#10 Funct = 4'b1000;
#10 Funct = 4'b0111;
#10 Funct = 4'b0110;
Funct = 4'bxxxx;
#10 ALUOp = 2'b00;
#10 ALUOp = 2'b01;

end

endmodule;