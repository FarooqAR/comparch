#Compiling design modules
vlog tb.v top.v instruction_parser.v registerfile.v instruction_memory.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/Inst_Address
add wave sim:/tb/Instruction
add wave sim:/tb/readData1
add wave sim:/tb/readData2
add wave sim:/tb/clk
run 200ns