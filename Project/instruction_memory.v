module Instruction_Memory(
	input [63:0] Inst_Address,
	output reg [31:0] instruction
);

reg [7:0] Instructions [15:0];
reg [7:0] i1;
reg [7:0] i2;
reg [7:0] i3;
reg [7:0] i4;
initial
begin
	Instructions[0] = 8'b10110011;
	Instructions[1] = 8'b00000100;
	Instructions[2] = 8'b10110101;
	Instructions[3] = 8'b00000000;
	Instructions[4] = 8'b00110011;
	Instructions[5] = 8'b10000110;
	Instructions[6] = 8'b11010100;
	Instructions[7] = 8'b01000000;
	Instructions[8] = 8'b10110011;
	Instructions[9] = 8'b01100110;
	Instructions[10] = 8'b10010110;
	Instructions[11] = 8'b00000000;
	Instructions[12] = 8'b10110011;
	Instructions[13] = 8'b11110101;
	Instructions[14] = 8'b10010110;
	Instructions[15] = 8'b00000000;
end

always @ (Inst_Address)
begin
	i1 = Instructions[Inst_Address % 16];
	i2 = Instructions[Inst_Address % 16 + 1];
	i3 = Instructions[Inst_Address % 16 + 2];
	i4 = Instructions[Inst_Address % 16 + 3];
	instruction = {i4, i3, i2, i1};
end
endmodule