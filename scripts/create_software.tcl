#
# create_software.tcl: Tcl script for re-creating Vitis project
# 
# requires sourcing the settings.tcl to define the following variables:
# project_name, vivado_dir, vitis_dir
# ########################################################################################

if {[file exists [file join scripts settings.tcl]] } { source [file join scripts settings.tcl] }
if {![info exists vivado_dir]} { set vivado_dir [file join Vivado ${module_name}] }
if {![info exists vitis_dir]} { set vitis_dir [file join Vitis ${module_name}] }

set xsa ${vivado_dir}/${project_name}.xsa
set app_name "xil_hello_world"

if { {getws} == {[file normalize ${vitis_dir}]} } { 
	puts "DEBUG: workspace is already set"
 } else { 
	setws -switch ${vitis_dir}
}

#create hardware platform
platform create -name ${project_name} -hw ${xsa} -proc {CPU_microblaze_CPU} -os {standalone}
platform write
platform read ${vitis_dir}/${project_name}/platform.spr
platform active ${project_name}

domain active {standalone_domain}
::scw::regenerate_psinit {::scw::get_hw_path}
::scw::get_mss_path

platform generate

#create an app from template
app create -name ${app_name} -platform ${project_name} -os standalone -proc CPU_microblaze_CPU -template {Hello World}
#replace default linker script
file copy -force scripts/lscript.ld ${vitis_dir}/xil_hello_world/src
app build -name ${app_name}

puts "INFO: END of [info script]"