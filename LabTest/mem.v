module Mem(
	input [3:0] addr,
	input [1:0] size,
	input rd, clk, reset,
	output reg [63:0] data
);
reg [7:0] mem [15:0];
integer i;


initial
begin
	for (i = 0; i < 16; i = i + 1)
	begin
		mem[i] = i;
	end
end


always @ (posedge clk)
begin
	if (reset == 1)
	begin
		for (i = 0; i < 16; i = i + 1)
		begin
			mem[i] = 0;
		end
		
	end
	if (rd == 1)
	begin
		case (size)
		2'b00:
			data = mem[addr]; // no need to apply module since max addr value would be 15
		2'b01:
			data = {mem[(addr + 1) % 16], mem[addr % 16]};
		2'b10:
			data = {mem[(addr + 3) % 16], mem[(addr + 2) % 16], mem[(addr + 1) % 16], mem[addr % 16]};
		2'b11:
			data = {mem[(addr + 7) % 16], mem[(addr + 6) % 16], mem[(addr + 5) % 16], mem[(addr + 4) % 16], mem[(addr + 3) % 16], mem[(addr + 2) % 16], mem[(addr + 1) % 16], mem[addr % 16]};
		endcase
	end
end

endmodule