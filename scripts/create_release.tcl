#
# create_release.tcl: Tcl script for building boot binaries
# 
# requires sourcing the settings.tcl to define the following variables:
# project_name, vivado_dir, vitis_dir
# ########################################################################################

if {[file exists [file join scripts settings.tcl]] } { source [file join scripts settings.tcl] }
if {![info exists vivado_dir]} { set vivado_dir [file join Vivado ${module_name}] }
if {![info exists vitis_dir]} { set vitis_dir [file join Vitis ${module_name}] }

# prepare output directories
set out_dir ${project_name}
set bin_dir ${out_dir}/binaries/${module_name}

catch {[file mkdir ${out_dir}]}
catch {[file mkdir ${out_dir}/doc]}
catch {[file mkdir ${out_dir}/src]}
catch {[file mkdir ${out_dir}/scripts]}
catch {[file mkdir ${bin_dir}]}

# source directories
set hw_dir ${project_name}/export/${project_name}/hw/
set sw_dir ${project_name}/export/${project_name}/sw/${project_name}/boot

set app_name "xil_hello_world"

# binaries
set XSA         ${vivado_dir}/${project_name}.xsa
set BITSTREAM   ${vitis_dir}/${project_name}/hw/${project_name}.bit
set APP         ${vitis_dir}/${app_name}/Debug/${app_name}.elf
set MMI         ${vitis_dir}/${app_name}/_ide/bitstream/${project_name}.mmi
set DOWNLOAD    ${vitis_dir}/${app_name}/_ide/bitstream/download.bit
set BIN_PRM     ${vitis_dir}/${app_name}/_ide/bootimage/${app_name}.bin.prm
set BIN         ${vitis_dir}/${app_name}/_ide/bootimage/${app_name}.bin

set DOC        doc/${project_name}.pdf
set SOURCES    [glob src/*]
set SCRIPTS    [list \
	scripts/settings.tcl \
	scripts/create_project.tcl \
	scripts/${project_name}_bd.tcl \
]

# copy files
file copy -force ${XSA}        ${bin_dir}
file copy -force ${BITSTREAM}   ${bin_dir}
file copy -force ${APP}         ${bin_dir}
file copy -force ${MMI}         ${bin_dir}
file copy -force ${DOWNLOAD}    ${bin_dir}
file copy -force ${BIN_PRM}     ${bin_dir}
file copy -force ${BIN}         ${bin_dir}

file copy -force ${DOC}         ${out_dir}/doc
file copy -force {*}${SOURCES}  ${out_dir}/src
file copy -force {*}${SCRIPTS}  ${out_dir}/scripts

# create zip files to release
exec zip -r -9 complete_${project_name}.zip {*}${out_dir}
if {[info exists baseboard]} {
	exec zip -r -j -9 binaries_${module_name}_${baseboard}.zip {*}${bin_dir}
} else {
	exec zip -r -j -9 binaries_${module_name}.zip {*}${bin_dir}
}
cd reports; exec zip -r -9 ../reports.zip .

puts "INFO: END of [info script]"