
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ripple_carry_counter -dir "C:/ripple_carry_counter/planAhead_run_2" -part xc6slx9csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ripple_carry_counter.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ripple_carry_counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ripple_carry_counter $srcset
add_files [list {ripple_carry_counter.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-3
