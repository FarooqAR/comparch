module tb();
reg [31:0] instruction;
wire [63:0] imm_data;
  
  ImmDataExtractor imm1
  (
  .instruction(instruction),
  .imm_data(imm_data)
  );
  
  initial 
  begin
  instruction = 32'b110100000010010110011;
  #60 instruction = 32'b00000001010110010111;
  end
endmodule
