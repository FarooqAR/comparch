#Compiling design modules
vlog exercise.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/Result
add wave sim:/tb/CarryOut

run 600ns
