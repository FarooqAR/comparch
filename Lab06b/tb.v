module tb();

reg clk, MemWrite, MemRead;
wire [63:0] Read_Data;
reg [63:0] Mem_Addr, Write_Data;

Data_Memory dm0(
	.Mem_Addr(Mem_Addr), 
	.Write_Data(Write_Data),
	.clk(clk), 
	.MemWrite(MemWrite),
	.MemRead(MemRead),
	.Read_Data(Read_Data)
);

always
#10 clk = ~clk;

initial
begin
	clk = 1;
	MemRead = 1;
	MemWrite = 0;
	Mem_Addr = 64'd0;
	#20 MemWrite = 1;
	Mem_Addr = 64'd1;
	Write_Data = 64'hFEDCBA9876543210;
end
endmodule