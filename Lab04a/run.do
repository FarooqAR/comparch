#Compiling design modules
vlog tb.v registerfile.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/WriteData
add wave sim:/tb/rs1
add wave sim:/tb/rs2
add wave sim:/tb/rd
add wave sim:/tb/readData1
add wave sim:/tb/readData2
add wave sim:/tb/clk
add wave sim:/tb/reset
add wave sim:/tb/RegWrite
run 200ns