module top(
    input [5:0] a,
    input [5:0] b,
    input [3:0] ALUOp,
    input CarryIn,
    output CarryOut,
    output [5:0] Result
);

wire c1, c2, c3, c4, c5;
ALU_1_bit a1 (
    .a(a[0]),
    .b(b[0]),
    .CarryIn(CarryIn),
    .CarryOut(c1),
    .Result(Result[0]),
    .ALUOp(ALUOp)
);
ALU_1_bit a2 (
    .a(a[1]),
    .b(b[1]),
    .CarryIn(c1),
    .CarryOut(c2),
    .Result(Result[1]),
    .ALUOp(ALUOp)
);
ALU_1_bit a3 (
    .a(a[2]),
    .b(b[2]),
    .CarryIn(c2),
    .CarryOut(c3),
    .Result(Result[2]),
    .ALUOp(ALUOp)
);
ALU_1_bit a4 (
    .a(a[3]),
    .b(b[3]),
    .CarryIn(c3),
    .CarryOut(c4),
    .Result(Result[3]),
    .ALUOp(ALUOp)
);
ALU_1_bit a5 (
    .a(a[4]),
    .b(b[4]),
    .CarryIn(c4),
    .CarryOut(c5),
    .Result(Result[4]),
    .ALUOp(ALUOp)
);
ALU_1_bit a6 (
    .a(a[5]),
    .b(b[5]),
    .CarryIn(c5),
    .CarryOut(CarryOut),
    .Result(Result[5]),
    .ALUOp(ALUOp)
);
endmodule