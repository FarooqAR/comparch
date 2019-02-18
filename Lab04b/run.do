#Compiling design modules
vlog tb.v imm_data_extractor.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/imm_data
add wave sim:/tb/instruction

run 600ns