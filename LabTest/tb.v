module tb();

reg [3:0] addr;
reg [1:0] size;
reg clk, reset, rd;
wire [63:0] data;

Mem m0(
	.addr(addr),
	.size(size),
	.clk(clk),
	.reset(reset),
	.rd(rd),
	.data(data)
);

always
	#10 clk = ~clk;

initial
begin
	clk = 0;
	addr = 4;
	size = 0;
	reset = 0;
	rd = 1;
	
	#20 size = 1;
	#20 size = 2;
	#20 size = 3;
	#20 addr = 12;
	rd = 0;
	#20 rd = 1;
	#20 reset = 1;
end
endmodule