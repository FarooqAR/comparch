vlog forw_unit_tb.v forwarding_unit.v
vsim -novopt work.forw_unit_tb
view wave
add wave sim:/forw_unit_tb/id_ex_rs1
add wave sim:/forw_unit_tb/id_ex_rs2
add wave sim:/forw_unit_tb/ex_mem_rd
add wave sim:/forw_unit_tb/mem_wb_rd
add wave sim:/forw_unit_tb/ex_mem_RegWrite
add wave sim:/forw_unit_tb/mem_wb_RegWrite
add wave sim:/forw_unit_tb/ForwardA
add wave sim:/forw_unit_tb/ForwardB

run 200ns



