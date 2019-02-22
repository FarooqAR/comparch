module tb();
reg sel;
reg [63:0] a;
reg [63:0] b;
wire [63:0] data_out;

mux m1
(
  .sel(sel),
  .a(a),
  .b(b),
  .data_out(data_out)
);

always
#10 sel = ~sel;

initial 
begin
sel = 1'b0;
a = 64'ha;
b = 64'hb;
#15 a = 64'hff;
$monitor("Time = ", $time, "----> Output = %d", data_out);  
end

  
endmodule