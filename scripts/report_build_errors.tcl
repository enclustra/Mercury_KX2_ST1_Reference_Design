#Please set command line arguments:
# #All arguments are optional  - the script will use the default value, if arguments are not specified
#  reports_dir                - reports directory, that will be created by this script

#default values
if {![info exists reports_dir]} {set reports_dir reports}

#if any arguments are present, use the values
#otherwise, use default values
if {[lindex $argv 0] != ""} { set reports_dir               [lindex $argv 0] }

set RESULT "PASSED"

if {[info exists RESULT]} {
	puts "==========================="
	puts "CHECKING REFDES FOR ISSUES:"
	puts "==========================="
}

#remove all old reports
catch {[file mkdir ${reports_dir}]}

if {[file exists ${reports_dir}/report_build_errors.log]} {file delete ${reports_dir}/build_errors.log}

proc write_to_log {something} {

	global reports_dir
	
	set fid [open ${reports_dir}/build_errors.log w]
	puts $fid ${something}
	close $fid
}

# find log files in reports directory given
set log_files	[glob ${reports_dir}/*.log]

foreach log_file ${log_files} {
	
	# set log_file [file normalize $log_file]
	if { ( [string first build_errors.log $log_file] == -1 ) || ( [string first report_build_errors.log $log_file] == -1 ) } {
	
		# if { [catch {[exec grep -n "INFO: " $log_file]} output_grep] == 0} {
			# puts "$log_file line $output_grep"
			# write_to_log "$log_file line $output_grep"
		# }

		if { [catch {exec grep -n "ERROR: " $log_file} output_grep] == 0} {
			puts "$log_file line $output_grep"
			write_to_log "$log_file line $output_grep"
			set RESULT "FAILED"
		}
		
		if { [catch {exec grep -n "CRITICAL WARNING: " $log_file} output_grep] == 0} {
			puts "$log_file line $output_grep"
			write_to_log "$log_file line $output_grep"
		}
		
		if { [catch {exec grep -n "while executing" $log_file} output_grep] == 0} {
			puts "$log_file line $output_grep"
			write_to_log "$log_file line $output_grep"
			set RESULT "FAILED"
		}
	}
}

if {[info exists RESULT]} {
	puts "======================================"
	puts "INFO: REFDES BUILD MIGHT HAVE $RESULT!"
	puts "======================================"
	set f [open $RESULT w+]
	close $f
}

puts "INFO: END of [info script]"