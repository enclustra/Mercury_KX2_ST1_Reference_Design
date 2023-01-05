#
# create_binaries.tcl: Tcl script for re-creating Vivado project
# 
# requires sourcing the settings.tcl to define the following variables:
# project_name, vitis_dir
# ########################################################################################

if {[file exists [file join scripts settings.tcl]] } { source [file join scripts settings.tcl] }
if {![info exists vitis_dir]} { set vitis_dir [file join Vitis ${module_name}] }

set app_name "xil_hello_world"

# output directory
set out_dir ${vitis_dir}/${app_name}/_ide/bootimage
catch {[file mkdir ${out_dir}]}

# source directories
set hw_dir ${project_name}/export/${project_name}/hw/
set sw_dir ${project_name}/export/${project_name}/sw/${project_name}/boot

# source files
set BITSTREAM   ${vitis_dir}/${project_name}/hw/${project_name}.bit
set APP         ${vitis_dir}/${app_name}/Debug/${app_name}.elf
set MMI         ${vitis_dir}/${app_name}/_ide/bitstream/${project_name}.mmi

# temporary files
set PRM         ${vitis_dir}/${app_name}/_ide/bootimage/${app_name}.prm

# output files
set DOWNLOAD    ${vitis_dir}/${app_name}/_ide/bitstream/download.bit
set BIN_PRM     ${vitis_dir}/${app_name}/_ide/bootimage/${app_name}.bin.prm
set BIN         ${vitis_dir}/${app_name}/_ide/bootimage/${app_name}.bin

# create download.bit file
set output_updatemem [exec updatemem -force -meminfo ${MMI} \
-bit ${BITSTREAM} \
-data ${APP} \
-proc ${module}_i/CPU/microblaze_CPU \
-out ${DOWNLOAD}]

puts "$output_updatemem"

# create .bin file
set output_write_cfgmem "write_cfgmem  \
-format bin \
-size 64 \
-interface SPIx4 \
-loadbit {up 0x00000000 ${DOWNLOAD} } \
-force \
-file ${BIN}"

eval ${output_write_cfgmem}
file rename -force ${PRM} ${BIN_PRM}

puts "INFO: END of [info script]"