transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/CPU_Package.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/Nibble_Counter.vhd}

vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/Controller_TB.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/Controller.vhd}
vcom -93 -work work {C:/Users/Markus Brislöv/Documents/IL1331 - VHDL Design/VHDL-Design/Lab4-5/ROM.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  Controller_TB

add wave *
view structure
view signals
run 200 ns
