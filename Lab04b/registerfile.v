module registerFile(
	// TODO: input address ports for reading register 1 and 2 and writing data in destination register
	input [63:0] WriteData,
	input [4:0] rs1,
	input [4:0] rs2,
	input [4:0] rd,
	output reg [63:0] readData1,
	output reg [63:0] readData2,
	input clk, reset, RegWrite
);

reg [63:0] Registers [31:0];
initial
begin
Registers[0] = 64'b0;
Registers[1] = 64'b0;
Registers[2] = 64'b10;	
Registers[3] = 64'b11;
Registers[4] = 64'b100;
Registers[5] = 64'b101;
Registers[6] = 64'b110;
Registers[7] = 64'b111;
Registers[8] = 64'b0;
Registers[9] = 64'b0;
Registers[10] = 64'b0;
Registers[11] = 64'b0;
Registers[12] = 64'b0;
Registers[13] = 64'b0;
Registers[14] = 64'b0;
Registers[15] = 64'b0;
Registers[16] = 64'b0;
Registers[17] = 64'b0;
Registers[18] = 64'b0;
Registers[19] = 64'b0;
Registers[20] = 64'b0;
Registers[21] = 64'b0;
Registers[22] = 64'b0;
Registers[23] = 64'b0;
Registers[24] = 64'b0;
Registers[25] = 64'b0;
Registers[26] = 64'b0;
Registers[27] = 64'b0;
Registers[28] = 64'b0;
Registers[29] = 64'b0;
Registers[30] = 64'b0;
Registers[31] = 64'b0;

end

always @ (posedge clk)
begin
	if (RegWrite) 
		Registers[rd] = WriteData;
end


always@(rs1 or rs2 or reset)
begin
	if (reset) 
		begin
			readData1 = 0;
			readData2 = 0;
		end
	else
		begin
			readData1 = Registers[rs1];
			readData2 = Registers[rs2];
		end
end


endmodule
