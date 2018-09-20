transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Markus Brisl�v/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/cpu_package.vhd}
vcom -93 -work work {C:/Users/Markus Brisl�v/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/counter.vhd}

vcom -93 -work work {C:/Users/Markus Brisl�v/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/counter_tb.vhd}
vcom -93 -work work {C:/Users/Markus Brisl�v/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/counter.vhd}
vcom -93 -work work {C:/Users/Markus Brisl�v/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/cpu_package.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  counter_tb

add wave *
view structure
view signals
run 200 ns