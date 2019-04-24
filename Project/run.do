#Compiling design modules
vlog tb.v adder.v instruction_memory.v pc.v alu_control.v control_unit.v data_memory.v mux.v registerfile.v processor.v alu_64.v imm_data_extractor.v instruction_parser.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/p0/*
add wave sim:/tb/p0/im0/Inst_Address
add wave sim:/tb/p0/a/*
add wave sim:/tb/p0/cu/*
add wave sim:/tb/p0/alu_c/*
add wave sim:/tb/p0/dm0/memory

run 200ns