#Compiling design modules
vlog tb.v mem.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

do wave.do

run 200ns