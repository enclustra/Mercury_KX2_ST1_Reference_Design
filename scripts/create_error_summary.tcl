#
# create_error_summary.tcl: Tcl script for copying single design reports to one overview
#
# doesn't require other sources
#
# ########################################################################################


# Open summary file and write header for csv
set fp_summ [open errors_summary.csv w]
puts $fp_summ "ReferenceDesign,ModulVariant,CriticalWarnings,Errors"
puts "ReferenceDesign,ModulVariant,CriticalWarnings,Errors"
close $fp_summ

# Find variant folders inside "reports/" structure
foreach dir [glob -join -type d -path reports/ *] {

	# search for overview files inside variant folders
	foreach file [glob -join -type f -dir $dir fail_overview.csv] {
		puts $file

		# copy all reports together in one summary file
		set fid [open $file r]
		set fp_summ [open errors_summary.csv a]
		
		# write characters to output file
		while {[gets $fid chars] >= 0} {
			puts $fp_summ $chars
		}
		close $fp_summ
		close $fid
	}
}

exit