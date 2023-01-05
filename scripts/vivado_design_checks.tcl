#Please set command line arguments:
# #All arguments are optional  - the script will use the default value, if arguments are not specified
#  vivado_dir                 - implementation directory in Vivado
#  project_name               - project name in Vivado
#  exit_on_error_crit_warn    - if 1, the TCL scripts issues an error, this will interrupt the external script (e.g Makefile)
#  exit_on_error_timing_viol  - if 1, the TCL scripts issues an error, this will interrupt the external script (e.g Makefile)
#  reports_dir                - reports directory, that will be created by this script

#default values
if {![info exists vivado_dir]} {set vivado_dir Vivado}
if {![info exists project_name]} {set project_name  MarsZX3}
if {![info exists exit_on_error_crit_warn]} {set exit_on_error_crit_warn 1}
if {![info exists exit_on_error_timing_viol]} {set exit_on_error_timing_viol 1}
if {![info exists reports_dir]} {set reports_dir reports}

#if any arguments are present, use the values
#otherwise, use default values
if {[lindex $argv 0] != ""} { set vivado_dir                [lindex $argv 0] }
if {[lindex $argv 1] != ""} { set project_name              [lindex $argv 1] }
if {[lindex $argv 2] != ""} { set exit_on_error_crit_warn   [lindex $argv 2] }
if {[lindex $argv 3] != ""} { set exit_on_error_timing_viol [lindex $argv 3] }
if {[lindex $argv 4] != ""} { set reports_dir               [lindex $argv 4] }


# Exit on error default 1 - Vivado should exit anyway
set exit_on_error 1
set error_found 0
set crit_warn_found 0
set viol_found 0

proc design_checks { vivado_dir reports_dir } {

    global error_found
    global crit_warn_found
    global viol_found

    set project_name [current_project]
    
    #remove all old reports
    catch {[file mkdir ${reports_dir}]}
    file delete ${reports_dir}/design_checks_summary.rpt
    file delete ${reports_dir}/design_checks_verbose.rpt
    file delete ${reports_dir}/worst_path_hold.rpt
    file delete ${reports_dir}/worst_path_setup.rpt
        
    set fid     [ open ${reports_dir}/design_checks_summary.rpt w]
    set fid_ver [ open ${reports_dir}/design_checks_verbose.rpt w]
    
    puts  $fid        "+-------------------------------+"
    puts  $fid        "| Begin of Design Checks Report |"
    puts  $fid        "+-------------------------------+"
    
    puts  $fid_ver    "+-------------------------------+"
    puts  $fid_ver    "| Begin of Design Checks Report |"
    puts  $fid_ver    "+-------------------------------+"

    
    foreach run [get_runs] {
    
        puts $fid     "\n\nCurrent run is: $run"
        puts $fid     "--------------------------------\n"
        puts $fid_ver "\n\nCurrent run is: $run"
        puts $fid_ver "--------------------------------\n"
    
        if {[get_property IS_IMPLEMENTATION [get_runs $run] ] } {
            
            if {[get_property PROGRESS [get_runs $run]] != "100%"} {
                puts "\nRun $run ignored in design check because it is not complete!\n"
                continue
            }
            
            open_run $run

            puts  $fid     "\n    Check for timing violations"
            puts  $fid     "    --------------------------------\n"
            puts  $fid_ver "\n    Check for timing violations"
            puts  $fid_ver "    --------------------------------\n"
            
            
            # check timing violations
            # Check setup timing
            if {[get_timing_paths -slack_lesser_than 0 -setup]!=""} {
            
                puts  $fid     "    Error! Setup violations detected! Check design_checks_verbose.rpt for details."
                puts  $fid_ver "    Error! Setup violations detected! Reporting worst path to worst_path_setup.rpt."
                report_timing -file ${reports_dir}/worst_path_setup.rpt -setup -verbose
                set viol_found 1
            
            } else {

                puts $fid     "    OK! No setup violations detected."
                puts $fid_ver "    OK! No setup violations detected."
            }
            
            # Check hold timing
            if {[get_timing_paths -slack_lesser_than 0 -hold]!=""} {
            
                puts $fid     "    Error! Hold violations detected! Check design_checks_verbose.rpt for details."
                puts $fid_ver "    Error! Hold violations detected! Reporting worst path to worst_path_hold.rpt."
                report_timing -file ${reports_dir}/worst_path_hold.rpt -hold -verbose
                set viol_found 1

            } else {
            
                puts $fid     "    OK! No hold violations detected."
                puts $fid_ver "    OK! No hold violations detected."
            }
            
                        
            # Check for latches
            set latch_count [llength [all_latches]]
            if {$latch_count > 0} {
                puts $fid          "    ERROR! The design contains $latch_count latches"
                puts $fid_ver      "    ERROR! The design contains $latch_count latches"
                set viol_found 1
            } else {
            
                puts $fid     "    OK! No latches detected."
                puts $fid_ver "    OK! No latches detected."
            }
            
            puts  $fid     "\n    Generationg IO Report"
            puts  $fid     "    --------------------------------\n"
            report_io -file ${reports_dir}/io_report.txt -format text -name io_1

            
        }

        #check logs for errors or critical warnings (e.g DRC, routing, etc)
        #if any, report them
        #log messages are preceded by: INFO WARNING CRITICAL_Warning ERROR
        
        puts  $fid         "\n    Check logs for Errors"
        puts  $fid         "    --------------------------------\n"
        puts  $fid_ver     "\n    Check logs for Errors"
        puts  $fid_ver     "    --------------------------------\n"
    
        
        catch {[exec grep "[0-9]* Critical Warnings and [0-9]* Errors encountered" ${vivado_dir}/${project_name}.runs/${run}/runme.log]} output_grep
        set fid_msg [ open ${reports_dir}/temporary_search.log w]
        puts $fid_msg ${output_grep}
        close $fid_msg
        
        set fid_msg [ open ${reports_dir}/temporary_search.log r]
        while {[gets $fid_msg line] >= 0} {
            #save the number of critical warnings and errors encountered
            regexp "([0-9]*) Critical Warnings and ([0-9]*) Errors encountered" $line match crit_warn_no err_no
        }
        close $fid_msg
        
        set module [string trim $vivado_dir "Vivado/"]
        
        
        set f_overview [ open ${reports_dir}/fail_overview.csv w]
        puts  $f_overview  "$project_name,$module,$crit_warn_no,$err_no"
        close $f_overview
        
        if {$err_no > 0} {
        
            puts $fid     "    $err_no Errors found! Check design_checks_verbose.rpt for details."
            puts $fid_ver "    $err_no Errors found!"
            puts $fid_ver [exec grep -n "ERROR:"             ${vivado_dir}/${project_name}.runs/${run}/runme.log ]
            set error_found 1

        } else {
            puts $fid     "    OK! No errors found."
            puts $fid_ver "    OK! No errors found."
        }
        
    
        puts  $fid        "\n    Check logs for Critical Warnings"
        puts  $fid        "    --------------------------------\n"
        puts  $fid_ver    "\n    Check logs for Critical Warnings"
        puts  $fid_ver    "    --------------------------------\n"
        
        
        if {$crit_warn_no > 0} {
    
            puts $fid     "     $crit_warn_no Critical Warnings found! Check design_checks_verbose.rpt for details."
            puts $fid_ver "     $crit_warn_no Critical Warnings found!"
            puts $fid_ver [exec grep -n "CRITICAL WARNING:"  ${vivado_dir}/${project_name}.runs/${run}/runme.log ]
            set crit_warn_found 1
    
        } else {
            puts $fid     "    OK! No critical warnings found."
            puts $fid_ver "    OK! No critical warnings found."
        }

        file delete ${reports_dir}/temporary_search.log

    }
    puts  $fid        "\n+------------------------------+"
    puts  $fid        "| End of Design Checks Report  |"
    puts  $fid        "+------------------------------+"
    
    puts  $fid_ver    "\n+------------------------------+"
    puts  $fid_ver    "| End of Design Checks Report  |"
    puts  $fid_ver    "+------------------------------+"

    close $fid    
    close $fid_ver

    
}

proc issue_error {found exit_on msg} {

    if {$found == 1 } {
        if {$exit_on == 1} {
            error "\nCannot continue! ${msg} were found in the design! Please check the design checks reports.\n"
        } else {
            puts "\n${msg} were found in the design! Please check the design checks reports."
            puts "Set exit on error corresponding TCL argument to 1 in order to stop the run when the problem appears.\n"
        }
    } else {
    
        puts "\nNo ${msg} were found in the design.\n"
    
    }

}
#Testing to see if project is already open .
if {[catch {current_project } result ]} {
    puts "DEBUG: Project $project_name is not open"
    # #so try and open it
    open_project ${vivado_dir}/${project_name}.xpr
} else {
    puts "Project $project_name is already open"
}

puts "*****************************************************************************"
puts ${vivado_dir}

design_checks ${vivado_dir} ${reports_dir}
issue_error $error_found      $exit_on_error             "Errors"
issue_error $crit_warn_found  $exit_on_error_crit_warn   "Critical warnings"
issue_error $viol_found       $exit_on_error_timing_viol "Timing violations"

puts "INFO: END of [info script]"
