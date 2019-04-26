module forw_unit_tb (
);
	

	//Wires and Registers
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
	id_ex_rs1 <= 5'd1;
	id_ex_rs2 <= 5'd2;
	ex_mem_rd <= 5'd3;
	mem_wb_rd <= 5'd4;
	ex_mem_RegWrite <= 1'b1;
	mem_wb_RegWrite <= 1'b1;
	
	#10 id_ex_rs1 <= 5'd3;
	id_ex_rs2 <= 5'd4;

	#10 id_ex_rs1 <= 5'd1;
	id_ex_rs2 <= 5'd2;
	ex_mem_rd <= 5'd0;
	mem_wb_rd <= 5'd0;
	end 


	//Modules
	forwarding_unit forwarding_unit
	(
		.id_ex_rs1(id_ex_rs1),
		.id_ex_rs2(id_ex_rs2),
		.ex_mem_RegWrite(ex_mem_RegWrite),
		.ex_mem_rd(ex_mem_rd),
		.mem_wb_RegWrite(mem_wb_RegWrite),
		.mem_wb_rd(mem_wb_rd),
		.ForwardA(ForwardA),
		.ForwardB(ForwardB)
	);

endmodule