#Compiling design modules
vlog tb.v control_unit.v alu_control.v

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb/opcode
add wave sim:/tb/Branch
add wave sim:/tb/MemRead
add wave sim:/tb/MemToReg
add wave sim:/tb/ALUOp
add wave sim:/tb/MemWrite
add wave sim:/tb/ALUSrc
add wave sim:/tb/RegWrite
add wave sim:/tb/Funct
add wave sim:/tb/Operation
run 200ns