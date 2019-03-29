#Compiling design modules
vlog tb.v adder.v instruction_memory.v pc.v alu_control.v control_unit.v data_memory.v mux.v registerfile.v processor.v alu_64.v pc.v imm_data_extractor.v instruction_parser.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/p0/im0/Inst_Address
run 200ns