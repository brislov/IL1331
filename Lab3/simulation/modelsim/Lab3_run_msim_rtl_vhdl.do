transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab3/cpu_package.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab3/rw_memory.vhd}

vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab3/register_file_tb.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab3/register_file.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab3/cpu_package.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  register_file_tb

add wave *
view structure
view signals
run 80 ns
