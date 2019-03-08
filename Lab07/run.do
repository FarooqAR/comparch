#Compiling design modules
vlog tb.v adder.v instruction_memory.v instruction_fetch.v pc.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/instruction
add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/if0/*
add wave sim:/tb/if0/a0/*
add wave sim:/tb/if0/im0/*
add wave sim:/tb/if0/pc0/*
run 200ns