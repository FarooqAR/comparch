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
add wave sim:/tb/t0/Branch
add wave sim:/tb/t0/MemRead
add wave sim:/tb/t0/MemToReg
add wave sim:/tb/t0/MemWrite
add wave sim:/tb/t0/ALUSrc
add wave sim:/tb/t0/RegWrite
add wave sim:/tb/t0/ALUOp
run 200ns