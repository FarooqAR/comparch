onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix unsigned /tb/addr
add wave -noupdate -format Literal /tb/size
add wave -noupdate -format Logic -radix unsigned /tb/clk
add wave -noupdate -format Logic -radix unsigned /tb/reset
add wave -noupdate -format Logic -radix unsigned /tb/rd
add wave -noupdate -format Literal -radix binary /tb/data
add wave -noupdate -format Literal /tb/m0/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {43 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {56 ns}
