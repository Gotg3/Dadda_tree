vcom -93 -work ./work ../src/dadda_package.vhd
vcom -93 -work ./work ../src/ha.vhd
vcom -93 -work ./work ../src/fa.vhd
vcom -93 -work ./work ../src/dadda.vhd
vcom -93 -work ./work ../src/MBE.vhd
vcom -93 -work ./work ../src/rca.vhd

vcom -93 -work ./work ../tb/tb_mbe.vhd

vsim work.mbe_test -t 10ns

add wave -position insertpoint sim:/mbe_test/*
add wave -position insertpoint sim:/mbe_test/mbe_mult/dadda/HA_1_L6/*

run 300 ns