#Compiling design modules
vlog tb_final.v adder.v alu_64.v alu_control.v control_unit.v data_memory.v ex_mem.v forward_A_mux.v forward_B_mux.v forwarding_unit.v id_ex.v if_id.v imm_data_extractor.v instruction_memory.v instruction_parser.v mem_wb.v mux.v pc.v pipelined_processor.v registerfile.v 

#no optimization
vsim -novopt work.tb

#view wave
view wave

#adding waves
add wave sim:/tb_final/clk
add wave sim:/tb_final/reset
add wave sim:/tb_final/risc_v/*

run 500ns