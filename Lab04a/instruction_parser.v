module InstructionParser (
  input [31:0] instruction,
  output reg [6:0] opcode,
  output reg [4:0] rd,
  output reg [2:0] funct3,
  output reg [4:0] rs1,
  output reg [4:0] rs2,
  output reg [6:0] funct7
);
  
  always @ instruction
  begin 
    opcode = instruction[6:0];
    rd = instruction[12:7];
    funct3 = instruction[15:13];
    rs1 = instruction[20:16];
    rs2 = instruction[25:21];
    funct7 = instruction[31:26];
  end

endmodule