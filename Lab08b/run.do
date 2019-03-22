#Compiling design modules
vlog tb.v alu_control.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/ALUOp
add wave sim:/tb/Funct
add wave sim:/tb/Operation
run 200ns