module tb();
  reg clk;
  reg reset;
  wire [4:0] q;
  
  ripple_carry_counter r1
  (
    .clk(clk),
    .reset(reset),
    .q(q)
  );
  initial
  clk = 1'b0;
  
  always
  #5 clk = ~clk;
  
  initial begin
    reset = 1'b1;
    #20 reset = 1'b0;
    #320 reset = 1'b1;
  end
  
  initial
  $monitor("Time = ", $time, "----> Output = %d", q);
endmodule