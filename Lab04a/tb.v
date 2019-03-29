module tb();

reg [63:0] WriteData;
reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;
wire [63:0] readData1;
wire [63:0] readData2;
reg clk, reset, RegWrite;

registerFile rf0(
		.WriteData(WriteData),
		.rs1(rs1),
		.rs2(rs2),
		.rd(rd),
		.readData1(readData1),
		.readData2(readData2),
		.clk(clk),
		.reset(reset),
		.RegWrite(RegWrite)
);

always
begin

#10 clk = ~clk;

end

initial
begin

// testcase 1 (Registers[0] should be 10)
clk = 1;
RegWrite = 1;
rs1 = 0;
rs2 = 0;
rd = 0;
reset = 1;
WriteData = 10;


// testcase 2 (readData1 should be 10)

#20 RegWrite = 0;
rs1 = 0;
reset = 0;

// testcase 3 (readData1 and readData2 should be 0)

#20 
rs1 = 0;
rs2 = 2;
reset = 1;

// testcase 4 (shouldnt write at clk=0)
#15
reset = 0;
rd = 1;
RegWrite = 1;
WriteData = 25;

#5 RegWrite = 0;

#20
rs1 = 1;

// testcase 5 (readData1 should be 0 at reset=1 and RegWrite=1 [check priority])
#20

RegWrite = 1;
rd = 2;
WriteData = 33;
rs1 = 2;
reset = 1;
#1 reset = 0; // readData1 now should be 33

// testcase6 shouldn't write at RegWrite=0
#20
reset = 0;
RegWrite = 0;
rd = 3;
WriteData = 44;
rs2 = 3;

end

endmodule