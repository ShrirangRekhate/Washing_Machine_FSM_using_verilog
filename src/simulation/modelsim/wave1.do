onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_Washing_Machine/clk
add wave -noupdate /tb_Washing_Machine/reset
add wave -noupdate /tb_Washing_Machine/start
add wave -noupdate /tb_Washing_Machine/door_close
add wave -noupdate /tb_Washing_Machine/filled
add wave -noupdate /tb_Washing_Machine/detergent_added
add wave -noupdate /tb_Washing_Machine/cycleTO
add wave -noupdate /tb_Washing_Machine/againwash
add wave -noupdate /tb_Washing_Machine/spinTO
add wave -noupdate /tb_Washing_Machine/drained
add wave -noupdate /tb_Washing_Machine/door_lock
add wave -noupdate /tb_Washing_Machine/motor_on
add wave -noupdate /tb_Washing_Machine/fill_val_on
add wave -noupdate /tb_Washing_Machine/drain_val_on
add wave -noupdate /tb_Washing_Machine/water_wash
add wave -noupdate /tb_Washing_Machine/done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {189 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 249
configure wave -valuecolwidth 43
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {183 ps}
