module forw_unit_tb (
);
	

	//Wires and Registers
	reg clk; 
	reg [4:0] id_ex_rs1;
	reg [4:0] id_ex_rs2;
	reg ex_mem_RegWrite; 
	reg [4:0] ex_mem_rd;
	reg mem_wb_RegWrite;
	reg [4:0] mem_wb_rd;
	wire [1:0] ForwardA;
	wire [1:0] ForwardB;

	//initialization
	initial
	begin
	clk <= 1'b0;
	id_ex_rs1 <= 5'd1;
	id_ex_rs2 <= 5'd2;
	ex_mem_rd <= 5'd3;
	mem_wb_rd <= 5'd4;
	ex_mem_RegWrite <= 1'b1;
	mem_wb_RegWrite <= 1'b1;
	end 


	//Modules
	forwarding_unit forwarding_unit
	(
		.clk(clk),
		.id_ex_rs1(id_ex_rs1),
		.id_ex_rs2(id_ex_rs2),
		.ex_mem_RegWrite(ex_mem_RegWrite),
		.ex_mem_rd(ex_mem_rd),
		.mem_wb_RegWrite(mem_wb_RegWrite),
		.mem_wb_rd(mem_wb_rd),
		.ForwardA(ForwardA),
		.ForwardB(ForwardB)
	);
	
		always
			#5 clk = ~clk; 

endmodule