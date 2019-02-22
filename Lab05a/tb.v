module tb();
wire CarryOut, Result;
reg a, b, CarryIn;
reg [3:0] ALUOp;

ALU_1_bit alu0(
	.a(a),
	.b(b),
	.CarryIn(CarryIn),
	.CarryOut(CarryOut),
	.ALUOp(ALUOp),
	.Result(Result)
);

initial
begin
a = 1'b1;
b = 1'b1;
CarryIn = 1'b0;
ALUOp = 4'b0110;
end

endmodule