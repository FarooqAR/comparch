module tb();
wire CarryOut;
wire [5:0] Result;
reg [5:0] a;
reg [5:0] b; 
reg CarryIn;
reg [3:0] ALUOp;

top t1(
	.a(a),
	.b(b),
	.CarryIn(CarryIn),
	.CarryOut(CarryOut),
	.ALUOp(ALUOp),
	.Result(Result)
);

initial
begin
a = 6'b110011;
b = 6'b101110;
CarryIn = 1'b0;
ALUOp = 4'b0110;
end

endmodule