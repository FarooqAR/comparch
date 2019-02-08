module top(
	input clk, reset, rx,
	output [3:0] q, 
	output tx
);

wire [7:0] counter_data;
assign counter_data = {4'b0000, q};
uart_top u_top (
	.clk(clk),
	.reset(reset),
	.rx(rx),
	.data_to_tx(counter_data),
	.tx(tx)
);

ripple_carry_counter rp_counter (
	.q(q),
	.clk(clk),
	.reset(reset)
);
endmodule