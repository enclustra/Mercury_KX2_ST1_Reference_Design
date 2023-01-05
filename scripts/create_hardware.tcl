#
# create_hardware.tcl: Tcl script for re-creating Vivado project
# 
# requires sourcing the settings.tcl to define the following variables:
# project_name, vivado_dir
# ########################################################################################

if {[file exists [file join scripts settings.tcl]] } { source [file join scripts settings.tcl] }
if {![info exists vivado_dir]} { set vivado_dir [file join Vivado ${module_name}] }

set vivado_project_path ${vivado_dir}/${project_name} 

#Testing to see if project is already open .
if {[catch {current_project } result ]} {
	puts "DEBUG: Project $project_name is not open"
	# #so try and open it
	open_project $vivado_project_path.xpr
} else {
	puts "DEBUG: Project $project_name is already open"
}

set impl_run [current_run -implementation]

if {[catch { launch_runs ${impl_run} -to_step write_bitstream } ]} {
    puts "DEBUG: ${impl_run} may have an error or is out of date, trying to recover by resetting to previous implementation step."
    reset_run ${impl_run} -prev_step
    launch_runs ${impl_run} -to_step write_bitstream
}

wait_on_run ${impl_run}

set vivado_version [version -short]
set vivado_year    [lindex [string map {"." " " "_" " "} "${vivado_version}"] 0]
set vivado_major   [lindex [string map {"." " " "_" " "} "${vivado_version}"] 1]

#starting version 2019.2 the SDK is replaced by Vitis; added second condition for Vivado versions >= 2020.1
if { (${vivado_year} > 2018 && ${vivado_major} > 1) || (${vivado_year} > 2019) } {
	write_hw_platform -fixed -force  -include_bit -file "${vivado_project_path}.xsa"
	validate_hw_platform "${vivado_project_path}.xsa"
} else {
	write_hwdef -force -file ${vivado_project_path}.runs/${impl_run}/system_top.hwdef
	write_sysdef -force -hwdef ${vivado_project_path}.runs/${impl_run}/system_top.hwdef \
	-bitfile ${vivado_project_path}.runs/${impl_run}/system_top.bit -file ${vivado_project_path}.runs/${impl_run}/system_top.sysdef
	catch {[file mkdir SDKexport]}
	file copy -force "${vivado_project_path}.runs/${impl_run}/system_top.sysdef SDKexport/system_top.hdf"
}

set exit_on_error_crit_warn 1
set exit_on_error_timing_viol 1
set reports_dir reports/${module_name}


puts "INFO: END of [info script]"

# check design for errors
puts "INFO: start checking design for errors and critical warnings..."
# clear the arguments because they are different than the settings.tcl file arguments
set argv $::argv
set argc $::argc
# exit_on_error_crit_warn = 0
set ::argv {"" "" 0 "" ""}
set ::argc [llength $::argv]
source scripts/vivado_design_checks.tcl
# restore arguments...
set ::argv $argv
set ::argc $argc