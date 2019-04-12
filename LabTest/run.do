#Compiling design modules
vlog tb.v mem.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/*

run 200ns