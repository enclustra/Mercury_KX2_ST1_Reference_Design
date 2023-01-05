# report_properties.tcl: Tcl script for reporting cell configuration
# 
# requires sourcing the settings.tcl to define the following variables:
# project_name, vivado_dir, module_name, baseboard
# ########################################################################################

if {[file exists scripts/settings.tcl] } { source scripts/settings.tcl }
if {![info exists vivado_dir]} { set vivado_dir "Vivado/${module_name}" }
set vivado_project_path ${vivado_dir}/${project_name} 

# when no baseboard exists, make this field empty
if {![info exists baseboard]} {set baseboard ""}

#Testing to see if project is already open .
if {[catch {current_project } result ]} {
    puts "DEBUG: Project $project_name is not open"
    # #so try and open it
    open_project $vivado_project_path.xpr
} else {
    puts "DEBUG: Project $project_name is already open"
}
open_bd_design [lindex [get_files *.bd] 0]

file mkdir reports/${module_name}

proc report_properties {module_name baseboard filename cell property_names} {

	if {[get_bd_cells $cell] !=""} {
		# get proptery values
		set property_values {}
				
		foreach name ${property_names} {
			lappend property_values [get_property $name [get_bd_cells $cell]]
			
		}
		set header [concat "module,baseboard," [join $property_names ","] ]
		set data [concat $module_name "," $baseboard "," [join $property_values ","] ]
		set csvfile [open "reports/${module_name}/${filename}.csv" w]
		puts $csvfile $header
		puts $csvfile $data
		close $csvfile
		
		puts "INFO: ${filename} written"
	} else {
		puts "${cell} not present in current block design"
	}
}

proc report_all_properties {module_name baseboard} {

	report_property -all [current_project] -file "./reports/${module_name}/properties_project.csv"
	report_property -all [current_fileset] -file "./reports/${module_name}/properties_fileset.csv"

	foreach cell [get_bd_cells] {
		set filename "./reports/${module_name}/properties[regsub "/" ${cell} "_"].csv"
		puts ${filename}
		report_property -all [get_bd_cells ${cell}] -file ${filename}
	}
}

proc report_env_lic {module_name} {

	set filename "./reports/${module_name}/report_environment.log"
	report_environment
	report_environment -file ${filename}
	
	set filename "./reports/${module_name}/license_status.log"
	report_ip_status -license_status
	report_ip_status -license_status -file ${filename}
}

report_env_lic $module_name

# microblaze properties
set cell "CPU/microblaze_CPU"
set property_names [list				\
	CONFIG.G_TEMPLATE_LIST				\
	CONFIG.C_FREQ						\
	CONFIG.C_DATA_SIZE					\
	CONFIG.C_DEBUG_ENABLED				\
	CONFIG.C_D_AXI						\
	CONFIG.C_USE_ICACHE					\
	CONFIG.C_USE_DCACHE					\
	CONFIG.C_DCACHE_ADDR_TAG			\
	CONFIG.C_CACHE_BYTE_SIZE			\
	CONFIG.C_DCACHE_BYTE_SIZE			\
	CONFIG.C_DEBUG_TRACE_SIZE			\
]
[report_properties $module_name $baseboard "Microblaze_Properties" $cell $property_names]

report_all_properties $module_name $baseboard

write_bd_tcl -force [file normalize "./reports/${module_name}/BD_export_top.tcl"]

puts "INFO: END of [info script]"