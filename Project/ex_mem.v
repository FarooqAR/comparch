module EX_MEM(
  input clk,
  
  // control
  input [1:0] WB,
  output reg [1:0] WB_Out,
  
  input [2:0] M,
  output reg Branch, MemWrite, MemRead,
  
  // data
  input [63:0] Adder_Result,
  output reg [63:0] Adder_Result_Out,
  
  input ALU_Zero,
  output reg ALU_Zero_Out,
  
  input [63:0] ALU_Result,
  output reg [63:0] ALU_Result_Out,
  
  input [63:0] Forward_B_Mux_Result,
  output reg [63:0] Forward_B_Mux_Result_Out,
  
  input [4:0] rd,
  output reg [4:0] rd_out
);

always @ (posedge clk)
begin
  // control
  WB_Out = WB;
  {Branch, MemWrite, MemRead} = M;
  
  // data
  Adder_Result_Out = Adder_Result;
  ALU_Zero_Out = ALU_Zero;
  ALU_Result_Out = ALU_Result;
  Forward_B_Mux_Result_Out = Forward_B_Mux_Result;
  rd_out = rd;
end

endmodule