#Compiling design modules
vlog tb.v data_memory.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/Read_Data
add wave sim:/tb/Write_Data
add wave sim:/tb/MemWrite
add wave sim:/tb/MemRead
add wave sim:/tb/Mem_Addr
add wave sim:/tb/clk
run 200ns