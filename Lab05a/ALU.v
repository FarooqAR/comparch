module ALU_1_bit(
	input a,b, CarryIn,
	input [3:0] ALUOp,
	output reg Result, CarryOut
);

wire mux1out, mux2out;
assign mux1out = ALUOp[3] ? ~a : a;
assign mux2out = ALUOp[2] ? ~b : b;

always @ (ALUOp)
begin
CarryOut = (a & CarryIn) + (b & CarryIn) + (a & b);
	case (ALUOp[1:0])
		2'b00:
			Result = mux1out & mux2out;
		2'b01:
			Result = mux1out | mux2out;
		2'b10 :
			Result = mux1out + mux2out + CarryIn;
	endcase

end
endmodule