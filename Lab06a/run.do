#Compiling design modules
vlog tb.v instruction_memory.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/instruction
add wave sim:/tb/Inst_Address
run 200ns