module ID_EX(
  input clk,
  
  // data
  input [63:0] Inst_Addr,
  output reg [63:0] Inst_Addr_Out,
  
  input [4:0] rs1,
  output reg [4:0] rs1_Out,
  
  input [4:0] rs2,
  output reg [4:0] rs2_Out,
  
  input [4:0] rd,
  output reg [4:0] rd_Out,
  
  input [63:0] ReadData1, 
  output reg [63:0] ReadData1_Out,
  
  input [63:0] ReadData2,
  output reg [63:0] ReadData2_Out,
  
  input [63:0] ImmediateData,
  output reg [63:0] ImmediateData_Out,
  
  input [3:0] Funct_Instruction, // Instruction [30, 14-12]
  output [3:0] Funct_Out, // Instruction [30, 14-12]

  // control
  input [1:0] WB,
  output reg [1:0] WB_Out,
  
  input [2:0] M,
  output reg [2:0] M_Out,
  
  input [2:0] EX,
  output reg [1:0] ALUOp,
  output reg ALUSrc
);

always @ (posedge clk)
begin
  // data
  Inst_Addr_Out = Inst_Addr;
  rs1_Out = rs1;
  rs2_Out = rs2;
  rd_Out = rd_Out;
  ReadData1_Out = ReadData1;
  ReadData2_Out = ReadData2;
  ImmediateData_Out = ImmediateData;
  Funct_Out = Funct_Instruction;
  
  // control
  WB_Out = WB;
  M_Out = M;
  ALUOp = EX[1:0];
  ALUSrc = EX[2];
end

endmodule