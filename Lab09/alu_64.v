// exercise
module alu_64(
	input [63:0] a,b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg CarryOut 
);


initial
begin
Result = 0;
CarryOut = 0;
end

always @ (a or b or ALUOp)
begin
	case(ALUOp)
	4'b0000:
		Result = a & b;
	4'b0010:
		Result = a + b;
	4'b0001:
		Result = a | b;
	4'b0110:
		Result = a - b;
	4'b1100:
		Result = ~a & ~b;
	endcase

	if (Result == 0)
		CarryOut = 1;
	else
		CarryOut = 0;
end
endmodule
