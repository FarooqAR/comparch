module ImmDataExtractor(
  input [31:0] instruction,
  output reg [63:0] imm_data
  );
  always @ (instruction)
  begin
  if (instruction[6] == 1)
    imm_data[11:0] <= {instruction[31] , instruction[7] , instruction[30:25] , instruction[11:8]};
    
  if(instruction[5] == 1)
    imm_data[11:0] <= {instruction[31:25] , instruction[11:7]};
    
  else
    imm_data[11:0] <= instruction[31:20];
  if (instruction[31] == 0)
    imm_data[63:12] <= {52{1'b0}};
  else
    imm_data[63:12] <= {52{1'b1}};
  end
endmodule