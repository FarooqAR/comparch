#Compiling design modules
vlog tb.v control_unit.v alu_control.v top.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/opcode
add wave sim:/tb/Funct
add wave sim:/tb/Operation
run 200ns