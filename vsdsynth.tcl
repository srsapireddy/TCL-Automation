#!/usr/bin/tclsh


#-----------------------------------------------------------#
#----- Checks whether vsdsynth usage is correct or not -----#
#-----------------------------------------------------------# 

set enable_prelayout_timing 1

#-----------------------------------------------------------------------------------------------------------------------------------------------------#
#------ converts .csv to matrix and creates initial variables "DesignName OutputDirectory NetlistDirectory EarlyLibraryPath LateLibraryPath"----------#
#----------- If you are modifying this script, please use above variables as starting point. Use "puts" command to report above variables-------------#
#-----------------------------------------------------------------------------------------------------------------------------------------------------#


set filename [lindex $argv 0]
package require csv
package require struct::matrix
struct::matrix m
set f [open $filename]
csv::read2matrix $f m , auto
close $f
set columns [m columns]

#m add columns $columns

m link my_arr
set num_of_rows [m rows]
set i 0
while {$i < $num_of_rows} {
	puts "\nInfo: Setting $my_arr(0,$i) as '$my_arr(1,$i)'"
	if {$i ==0} {
		set [string map {" " ""} $my_arr(0,$i)] $my_arr(1,$i)
	} else {
		set [string map {" " ""} $my_arr(0,$i)] [file normalize $my_arr(1,$i)]	
	}
	set i [expr {$i+1}]
}

puts "\nInfo about initial varible and there values"
puts "DesignName = $DesignName"
puts "OutputDirectory = $OutputDirectory"
puts "NetlistDirectory = $NetlistDirectory"
puts "EarlyLibraryPath = $EarlyLibraryPath"
puts "LateLibraryPath = $LateLibraryPath"
puts "ConstraintsFile = $ConstraintsFile"

#-------------------------------------------------------------------------------------------#
#-----Below script checks if directories and files mentioned in csv file, exists or not-----#
#-------------------------------------------------------------------------------------------#

if {![file isdirectory $OutputDirectory]} {
	puts "\nInfo: Cannot find output directory. Creating $OutputDirectory"
	file mkdir $OutputDirectory
} else {
	puts "\nInfo: Output Directory found in path $OutputDirectory"
}
if {![file isdirectory $NetlistDirectory]} {
	puts "\nInfo: Cannot find RTL netlist directory in path $NetlistDiretory. Existing..."
	exit
} else {
	puts "\nInfo: RTL Netlist found in the path $NetlistDirectory"
}
if {![file exists $EarlyLibraryPath]} {
	puts "\nInfo: Cannot find early cell library path in $EarlyLibraryPath, Existing..."
	exit
} else {
	puts "\nInfo: File found in the path $EarlyLibraryPath"
}
if {![file exists $LateLibraryPath]} {
	puts "\nInfo: Cannot find Late cell library path in $LateLibraryPath, Existing..."
	exit
} else {
	puts "\nInfo: File found in the path $LateLibraryPath"
}
if {![file exists $ConstraintsFile]} {
	puts "\nInfo: Cannot find constraints file path in $ConstraintsFile, Existing..."
	exit
} else {
	puts "\nInfo: File found in the path $ConstraintsFile"
}


#--------------------------------------------------------------------------------------------------#
#----------------------  Constraints file creations: SDC Format -----------------------------------#
#--------------------------------------------------------------------------------------------------#

puts "\nInfo: Dumping SDC constraints for $DesignName"
::struct::matrix constraints
set chan [open $ConstraintsFile]
csv::read2matrix $chan constraints , auto
close $chan
set numbers_of_rows [constraints rows]
#puts "\n$numbers_of_rows"
set numbers_of_columns [constraints columns]
#puts "\n$numbers_of_columns"
set clock_start [lindex [lindex [constraints search all CLOCKS] 0] 1]
set clock_start_column [lindex [lindex [constraints search all CLOCKS] 0] 0]
set input_ports_start [lindex [lindex [constraints search all INPUTS] 0] 1]
set output_ports_start [lindex [lindex [constraints search all OUTPUTS] 0] 1]

#puts "\n clock_start = $clock_start"
#puts "\n clock_start_column = $clock_start_column"
#puts "\n input_ports_start = $input_ports_start"
#puts "\n output_ports_start = $output_ports_start"

#-------------------clock constraints--------------------#
#-------------------clock latency constraints------------#

set clock_early_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] early_rise_delay] 0] 0]
set clock_early_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] early_fall_delay] 0] 0]
set clock_late_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] late_rise_delay] 0] 0]
set clock_late_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] late_fall_delay] 0] 0]

#-------------------clock transition constraints------------#

set clock_early_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] early_rise_slew] 0] 0]
set clock_early_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] early_fall_slew] 0] 0]
set clock_late_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] late_rise_slew] 0] 0]
set clock_late_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $clock_start [expr {$numbers_of_columns-1}] [expr {$input_ports_start-1}] late_fall_slew] 0] 0]

#puts "\nclock_early_rise_delay_start = $clock_early_rise_delay_start"
#puts "\nclock_early_fall_delay_start = $clock_early_fall_delay_start "
#puts "\nclock_late_rise_delay_start = $clock_late_rise_delay_start "
#puts "\nclock_late_fall_delay_start =$clock_late_fall_delay_start "
#puts "\nclock_early_rise_slew_start = $clock_early_rise_slew_start"
#puts "\nclock_early_fall_slew_start = $clock_early_fall_slew_start"
#puts "\nclock_late_rise_slew_start = $clock_late_rise_slew_start"
#puts "\nclock_late_fall_slew_start = $clock_late_fall_slew_start"



set sdc_file [open $OutputDirectory/$DesignName.sdc "w"]
set i [expr {$clock_start+1}]
set end_of_ports [expr {$input_ports_start-1}]
puts "\nInfo-SDC: Working on Clock Constraints...."
while {$i < $end_of_ports} {
	puts -nonewline $sdc_file "\ncreate_clock -name [constraints get cell 0 $i] -period [constraints get cell 1 $i] -waveform \{0 [expr {[constraints get cell 1 $i]*[constraints get cell 2 $i]/100}]\} \[get_ports [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_transition -rise -min [constraints get cell $clock_early_rise_slew_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_transition -fall -min [constraints get cell $clock_early_fall_slew_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_transition -rise -max [constraints get cell $clock_late_rise_slew_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_transition -fall -max [constraints get cell $clock_late_fall_slew_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_latency -source -early -rise [constraints get cell $clock_early_rise_delay_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_latency -source -early -fall [constraints get cell $clock_early_fall_delay_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_latency -source -late -rise [constraints get cell $clock_late_rise_delay_start $i] \[get_clocks [constraints get cell 0 $i]\]"
	puts -nonewline $sdc_file "\nset_clock_latency -source -late -fall [constraints get cell $clock_late_fall_delay_start $i] \[get_clocks [constraints get cell 0 $i]\]"

	set i [expr {$i+1}]
}


#------------------------------------------------------------------------------##
#-------------------create input delay and slew constraints--------------------##
#------------------------------------------------------------------------------##

set input_early_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] early_rise_delay] 0] 0]
set input_early_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] early_fall_delay] 0] 0]
set input_late_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] late_rise_delay] 0] 0]
set input_late_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] late_fall_delay] 0] 0]

set input_early_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] early_rise_slew] 0] 0]
set input_early_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] early_fall_slew] 0] 0]
set input_late_rise_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] late_rise_slew] 0] 0]
set input_late_fall_slew_start [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] late_fall_slew] 0] 0]

set related_clock [lindex [lindex [constraints search rect $clock_start_column $input_ports_start [expr {$numbers_of_columns-1}] [expr {$output_ports_start-1}] clocks] 0] 0]

#puts "\ninput_early_rise_delay_start = $input_early_rise_delay_start"
#puts "\ninput_early_fall_delay_start = $input_early_fall_delay_start "
#puts "\ninput_late_rise_delay_start = $input_late_rise_delay_start "
#puts "\ninput_late_fall_delay_start =$input_late_fall_delay_start "
#puts "\ninput_early_rise_slew_start = $input_early_rise_slew_start"
#puts "\ninput_early_fall_slew_start = $input_early_fall_slew_start"
#puts "\ninput_late_rise_slew_start = $input_late_rise_slew_start"
#puts "\ninput_late_fall_slew_start = $input_late_fall_slew_start"

set i [expr {$input_ports_start+1}]
set end_of_ports [expr {$output_ports_start-1}]
puts "\nInfo-SDC: Working on IO Constraints......"
puts "\nInfo-SDC: Categorizing input ports as bits and buses"
#puts "\n $i"
while {$i < $end_of_ports} {
#---------------differentiating input ports as bussed and bits-------------------# 
	set netlist [glob -dir $NetlistDirectory *.v]
	set tmp_file [open /tmp/1 w]
	foreach f $netlist {
		set fd [open $f]
		puts "Reading File $f"
		while {[gets $fd line] != -1} {
			set pattern1 " [constraints get cell 0 $i];"
			if {[regexp -all -- $pattern1 $line]} {
				puts "pattern \"$pattern1 found and matching line in verilog file \"$f\ is \"$line\""
		        set pattern2 [lindex [split $line ";"] 0]
			 	puts "Creating pattern2 by splitting pattern1 using semi-colon as delimiter => \"$pattern2\""
			 	if {[regexp -all {input} [lindex [split $pattern2 "\S+"] 0]]} {
					puts "out of all patterns, \"$pattern2\" has matching string \"input\". So preserving this line and ignoring others"
					set s1 "[lindex [split $pattern2 "\S+"] 0] [lindex [split $pattern2 "\S+"] 1] [lindex [split $pattern2 "\S+"] 2]"
					puts "Printing First 3 elements of pattern2 \"$s1\" using space as demlimiter"
					puts -nonewline $tmp_file "\n[regsub -all {\s+} $s1 " "]"
					puts "Replace mulitple spaces in s1 by single space and reformat as \"[regsub -all {\s+} $s1 " "]\""
				}	
		
			}
			
		}
		close $fd
	}
	close $tmp_file


	set tmp_file [open /tmp/1 r]
	#puts "reading [read $tmp_file]"
	#puts "reading /tmp/1 file as [split [read $tmp_file] \n]"
	#puts "sorting /tmp/1 contents as [lsort -unique [split [read $tmp_file] \n]]"
	#puts "joinig /tmp/1 as [join [lsort -unique [split [read $tmp_file] \n ]] \n]"
	set tmp2_file [open /tmp/2 w]
	puts -nonewline $tmp2_file "[join [lsort -unique [split [read $tmp_file] \n]] \n]"
	close $tmp_file
	close $tmp2_file
	set tmp2_file [open /tmp/2 r]
	#puts "count is [llength [read $tmp2_file]]"
	set count [llength [read $tmp2_file]]
	puts "Splitting content of tmp_2 using space and counting number of elements as $count"
	if {$count > 2} {
		set inp_ports [concat [constraints get cell 0 $i]*]
		puts "Busess"
	} else {
		set inp_ports [constraints get cell 0 $i]
		puts "Not Busess"
	}
	
	puts "input port name is $inp_ports since count is $count\n"
	puts -nonewline $sdc_file "\nset_input_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -rise -source_latency_included [constraints get cell $input_early_rise_delay_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -fall -source_latency_included [constraints get cell $input_early_fall_delay_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -rise -source_latency_included [constraints get cell $input_late_rise_delay_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -fall -source_latency_included [constraints get cell $input_late_fall_delay_start $i] \[get_ports $inp_ports\]"

	puts -nonewline $sdc_file "\nset_input_transition -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -rise -source_latency_included [constraints get cell $input_early_rise_slew_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_transition -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -fall -source_latency_included [constraints get cell $input_early_fall_slew_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_transition -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -rise -source_latency_included [constraints get cell $input_late_rise_slew_start $i] \[get_ports $inp_ports\]"
	puts -nonewline $sdc_file "\nset_input_transition -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -fall -source_latency_included [constraints get cell $input_late_fall_slew_start $i] \[get_ports $inp_ports\]"

	set i [expr {$i+1}]

}
close $tmp2_file


#------------------------------------------------------------------------------##
#-------------------create output delay and load constraints--------------------##
#------------------------------------------------------------------------------##

set output_early_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] early_rise_delay] 0] 0]
set output_early_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] early_fall_delay] 0] 0]
set output_late_rise_delay_start [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] late_rise_delay] 0] 0]
set output_late_fall_delay_start [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] late_fall_delay] 0] 0]

set output_load_start [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] load] 0] 0]
set related_clock [lindex [lindex [constraints search rect $clock_start_column $output_ports_start [expr {$numbers_of_columns-1}] [expr {$numbers_of_rows-1}] clocks] 0] 0]

set i [expr {$output_ports_start+1}]
set end_of_ports [expr {$numbers_of_rows}]
puts "\nInfo-SDC: Working on IO Constraints....."
puts "\nInfo_SDC: Categorizing output ports as bits and buses"

while { $i < $end_of_ports } {
########### optional script --- differentiating input ports as buses and bits --- ##########
	set netlist [glob -dir $NetlistDirectory *.v]
	set tmp_file [open /tmp/1 w]
	foreach f $netlist {
		set fd [open $f]
		#puts "Reading File $f"
		while {[gets $fd line] != -1} {
			set pattern1 " [constraints get cell 0 $i];"
			if {[regexp -all -- $pattern1 $line]} {
				#puts "pattern \"$pattern1 found and matching line in verilog file \"$f\ is \"$line\""
		        set pattern2 [lindex [split $line ";"] 0]
			 	#puts "Creating pattern2 by splitting pattern1 using semi-colon as delimiter => \"$pattern2\""
			 	if {[regexp -all {output} [lindex [split $pattern2 "\S+"] 0]]} {
					#puts "out of all patterns, \"$pattern2\" has matching string \"input\". So preserving this line and ignoring others"
					set s1 "[lindex [split $pattern2 "\S+"] 0] [lindex [split $pattern2 "\S+"] 1] [lindex [split $pattern2 "\S+"] 2]"
					#puts "Printing First 3 elements of pattern2 \"$s1\" using space as demlimiter"
					puts -nonewline $tmp_file "\n[regsub -all {\s+} $s1 " "]"
					#puts "Replace mulitple spaces in s1 by single space and reformat as \"[regsub -all {\s+} $s1 " "]\""
				}	
		
			}
			
		}
		close $fd
	}
	close $tmp_file


	set tmp_file [open /tmp/1 r]
	#puts "reading [read $tmp_file]"
	#puts "reading /tmp/1 file as [split [read $tmp_file] \n]"
	#puts "sorting /tmp/1 contents as [lsort -unique [split [read $tmp_file] \n]]"
	#puts "joinig /tmp/1 as [join [lsort -unique [split [read $tmp_file] \n ]] \n]"
	set tmp2_file [open /tmp/2 w]
	puts -nonewline $tmp2_file "[join [lsort -unique [split [read $tmp_file] \n]] \n]"
	close $tmp_file
	close $tmp2_file
	set tmp2_file [open /tmp/2 r]
	#puts "count is [llength [read $tmp2_file]]"
	set count [llength [read $tmp2_file]]
	#puts "Splitting content of tmp_2 using space and counting number of elements as $count"
	if {$count > 2} {
		set op_ports [concat [constraints get cell 0 $i]*]
		#puts "Busess"
	} else {
		set op_ports [constraints get cell 0 $i]
		#puts "Not Busess"
	}
	
	#puts "output port name is $inp_ports since count is $count\n"
	puts -nonewline $sdc_file "\nset_output_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -rise -source_latency_included [constraints get cell $output_early_rise_delay_start $i] \[get_ports $op_ports\]"
	puts -nonewline $sdc_file "\nset_output_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -min -fall -source_latency_included [constraints get cell $output_early_fall_delay_start $i] \[get_ports $op_ports\]"
	puts -nonewline $sdc_file "\nset_output_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -rise -source_latency_included [constraints get cell $output_late_rise_delay_start $i] \[get_ports $op_ports\]"
	puts -nonewline $sdc_file "\nset_output_delay -clock \[get_clocks [constraints get cell $related_clock $i]\] -max -fall -source_latency_included [constraints get cell $output_late_fall_delay_start $i] \[get_ports $op_ports\]"
	puts -nonewline $sdc_file "\nset_load [constraints get cell $output_load_start $i] \[get_ports $op_ports\]"
	
	set i [expr {$i+1}]

}
close $tmp2_file
close $sdc_file

puts "\nInfo: SDC Created. Please use constraints in path $OutputDirectory/$DesignName.sdc"
	


#----------------------------------------------------------------------------#
#--------------------------------Hierarchy Check-----------------------------#
#----------------------------------------------------------------------------#


puts "\nInfo: Creating hierarchy check script to be used by Yosys"
set data "read_liberty -lib -ignore_miss_dir -setattr blackbox ${LateLibraryPath}"
puts "data is \"$data\""
set filename "$DesignName.hier.ys"
puts "filename is \"$filename\""
set fileId [open $OutputDirectory/$filename "w"]
puts "open \"$OutputDirectory/$filename\" in write mode"
puts -nonewline $fileId $data
set netlist [glob -dir $NetlistDirectory *.v]
puts "netlist is \"$netlist\""
foreach f $netlist {
	set data $f
	puts "data is \"$f\""
	puts -nonewline $fileId "\nread_verilog $f"
}
puts -nonewline $fileId "\nhierarchy -check"
close $fileId

puts "\nclose \"$OutputDirectory/$filename\"\n"
puts "\nChecking hierarachy..........."
set my_err [catch {exec yosys -s $OutputDirectory/$DesignName.hier.ys >& $OutputDirectory/$DesignName.hierarchy_check.log} msg]
puts "err_flag is $my_err"

if {$my_err} {
	set filename "$OutputDirectory/$DesignName.hierarchy_check.log"
	puts "log file name is $filename"
	set pattern {referenced in module}
	puts "pattern is $pattern"
	set count 0
	set fid [open $filename r]
	while {[gets $fid line] != -1} {
		incr count [regexp -all -- $pattern $line]
		if {[regexp -all -- $pattern $line]} {
			puts "\nError: module [lindex $line 2] is not part of design $DesignName. Please correct the RTL in the path $NetlistDirectory"
			puts "\nInfo: Hierarchy Check FAIL"
		}
	}
	close $fid
} else {
	puts "\nInfo: Hierarchy check PASS"
}
puts "\nInfo: Please Find hierarchy check details in [file normalize $OutputDirectory/$DesignName.hierarchy_check.log] for more info"

#----------------------------------------------------------------------------#
#--------------------------Main synthesis script-----------------------------#
#----------------------------------------------------------------------------#

puts "\nInfo: Creating main synthesis script to be used by Yosys"
set data  "read_liberty -lib -ignore_miss_dir -setattr blackbox ${LateLibraryPath}"
set filename "$DesignName.ys"
set fileId [open $OutputDirectory/$filename "w"]
puts -nonewline $fileId $data

set netlist [glob -dir $NetlistDirectory *.v]
foreach f $netlist {
  set data $f
  puts -nonewline $fileId "\nread_verilog $f"
}
puts -nonewline $fileId "\nhierarchy -top $DesignName"
puts -nonewline $fileId "\nsynth -top $DesignName"
puts -nonewline $fileId "\nsplitnets -ports -format ___\ndfflibmap -liberty ${LateLibraryPath}\nopt"
puts -nonewline $fileId "\nabc -liberty ${LateLibraryPath} "
puts -nonewline $fileId "\nflatten"
puts -nonewline $fileId "\nclean -purge\niopadmap -outpad BUFX2 A:Y -bits\nopt\nclean"
puts -nonewline $fileId "\nwrite_verilog $OutputDirectory/$DesignName.synth.v"
close $fileId
puts "\nInfo: Synthesis script created and can be accessed from path $OutputDirectory/$DesignName.ys"

puts "\nInfo: Running synthesis..............."

#----------------------------------------------------------------------------#
#----------------------Run synthesis script using yosys----------------------#
#----------------------------------------------------------------------------#

if {[catch {exec yosys -s $OutputDirectory/$DesignName.ys >& $OutputDirectory/$DesignName.synthesis.log} msg]} {
  puts "\nError: Synthesis failed due to errors. Please refer to log $OutputDirectory/$DesignName.synthesis.log"
  exit
} else {
  puts "\nInfo: Synthesis finished successfully"
}
puts "\nInfo: Please refer to log $OutputDirectory/$DesignName.synthesis.log"

#----------------------------------------------------------------------------#
#----------------Edit synth.v to be usable by Opentimer----------------------#
#----------------------------------------------------------------------------#


set fileId [open /tmp/1 "w"]
puts -nonewline $fileId [exec grep -v -w "*" $OutputDirectory/$DesignName.synth.v]
close $fileId

set output [open $OutputDirectory/$DesignName.final.synth.v "w" ]

set filename "/tmp/1"
set fid [open $filename r]

while {[gets $fid line] != -1} {
  puts -nonewline $output [string map {"\\" ""} $line]
  puts -nonewline $output "\n"
}
close $fid
close $output

puts "\nInfo: Please find the synthesized netlist for $DesignName at below. You can use this netlist for STA or PNR"
puts "\n $OutputDirectory/$DesignName.final.synth.v"

#----------------------------------------------------------------------------#
#-------------------------STA using Opentimer--------------------------------#
#----------------------------------------------------------------------------#

puts "\nInfo: Timing Analysis Started........."
puts "\nInfo: Initializing number of threads, libraries, sdc, verilog netlist path...."
source /home/vsduser/vsdsynth/procs/reopenStdout.proc
source /home/vsduser/vsdsynth/procs/set_num_threads.proc
reopenStdout $OutputDirectory/$DesignName.conf
set_multi_cpu_usage -localCpu 4

source /home/vsduser/vsdsynth/procs/read_lib.proc
read_lib -early /home/vsduser/vsdsynth/osu018_stdcells.lib

read_lib -late /home/vsduser/vsdsynth/osu018_stdcells.lib

source /home/vsduser/vsdsynth/procs/read_verilog.proc
read_verilog $OutputDirectory/$DesignName.final.synth.v

source /home/vsduser/vsdsynth/procs/read_sdc.proc 
read_sdc $OutputDirectory/$DesignName.sdc
reopenStdout /dev/tty

if {$enable_prelayout_timing == 1} {
  puts "\nInfo: enable_prelayout_timing is $enable_prelayout_timing. Enabling zero-wire load parasitics"
  set spef_file [open $OutputDirectory/$DesignName.spef w]
  puts $spef_file "*SPEF \"IEEE 1481-1996\""
  puts $spef_file "*DESIGN \"$DesignName\""
  puts $spef_file "*DATE \"SAT - 2023\""
  puts $spef_file "*VENDOR \"TAU 2015 Contest\""
  puts $spef_file "*PROGRAM \"Benchmark Parasitic Generator\""
  puts $spef_file "*VERSION \"0.0\""
  puts $spef_file "*DESIGN_FLOW \"NETLIST_TYPE_VERILOG\""
  puts $spef_file "*DIVIDER / "
  puts $spef_file "*DELIMITER : "
  puts $spef_file "*BUS_DELIMITER [ ] "
  puts $spef_file "*T_UNIT 1 PS"
  puts $spef_file "*C_UNNIT 1 FF"
  puts $spef_file "*R_UNIT 1 KOHM"
  puts $spef_file "*L_UNIT 1UH"
}
close $spef_file

set conf_file [open $OutputDirectory/$DesignName.conf a]
puts $conf_file "set_spef_fpath $OutputDirectory/$DesignName.spef"
puts $conf_file "init_timer "
puts $conf_file "report_timer "
puts $conf_file "report_wns "
puts $conf_file "report_worst_paths -numPaths 10000 "
close $conf_file

set tcl_precision 3
set time_elapsed_in_us [time {exec /home/vsduser/OpenTimer-1.0.5/bin/OpenTimer < $OutputDirectory/$DesignName.conf >& $OutputDirectory/$DesignName.results} 1]
puts "time_elapsed_in_us is $time_elapsed_in_us"
set time_elapsed_in_sec "[expr {[lindex $time_elapsed_in_us 0]/10000}] sec"
puts "time_elapsed_in_sec is $time_elapsed_in_sec seconds"
puts "\nInfo: STA finished in $time_elapsed_in_sec seconds"
puts "\nInfo: Refer to $OutputDirectory/$DesignName.results for warnings and errors"

#puts "tcl_precision is $tcl_precision"


#-------------------------------Find worst output violation---------------------------------#

set worst_RAT_slack "-"
set report_file [open $OutputDirectory/$DesignName.results r]
#puts "report_file is $OutputDirectory/$DesignName.results"
set pattern {RAT}
#puts "pattern is $pattern"
while {[gets $report_file line] != -1} {
  if {[regexp $pattern $line]} {
   #puts "pattern \"$pattern\" found in \"$line\""
   #puts "old_worst_RAT_slack is $worst_RAT_slack"
    set worst_RAT_slack "[expr {[lindex $line 3]/1000}]ns"
   #puts "part1 is [lindex $line 3]"
   #puts "new worst_RAT_slack is $worst_RAT_slack"
   #puts "Breaking"
    break  
  } else {
    continue
  }
}
close $report_file

#---------------------------find number of output vioation--------------------------------------

set report_file [open $OutputDirectory/$DesignName.results r]
set count 0
while {[gets $report_file line] != -1} {
  incr count [regexp -all -- $pattern $line]
}
set Number_output_violations $count
close $report_file

######----find worst setup violation##############

set worst_negative_setup_slack "-"
set report_file [open $OutputDirectory/$DesignName.results r]
#puts "report_file is $OutputDirectory/$DesignName.results"
set pattern {Setup}
#puts "pattern is $pattern"
while {[gets $report_file line] != -1} {
  if {[regexp $pattern $line]} {
    #puts "pattern \"$pattern\" found in \"$line\""
    #puts "old_worst_RAT_slack is $worst_RAT_slack"
    set worst_negative_setup_slack "[expr {[lindex $line 3]/1000}]ns"
    #puts "part1 is [lindex $line 3]"
    #puts "new worst_negatvie_setup_slack is $worst_negative_setup_slack"
    #puts "Breaking"
    break  
  } else {
    continue
  }
}
close $report_file

#------------------------------find number of setup vioation-----------------------------------

set report_file [open $OutputDirectory/$DesignName.results r]
set count 0
while {[gets $report_file line] != -1} {
  incr count [regexp -all -- $pattern $line]
}
set Number_of_setup_violations $count
close $report_file

######----find worst hold violation##############

set worst_negative_hold_slack "-"
set report_file [open $OutputDirectory/$DesignName.results r]
#puts "report_file is $OutputDirectory/$DesignName.results"
set pattern {Hold}
#puts "pattern is $pattern"
while {[gets $report_file line] != -1} {
  if {[regexp $pattern $line]} {
    #puts "pattern \"$pattern\" found in \"$line\""
    #puts "old_worst_RAT_slack is $worst_RAT_slack"
    set worst_negative_hold_slack "[expr {[lindex $line 3]/1000}]ns"
    #puts "part1 is [lindex $line 3]"
    #puts "new worst_negatvie_hold_slack is $worst_negative_hold_slack"
    break  
  } else {
    continue
  }
}
close $report_file

#-------------------------------------find number of hold vioation---------------------------------------

set report_file [open $OutputDirectory/$DesignName.results r]
set count 0
while {[gets $report_file line] != -1} {
  incr count [regexp -all -- $pattern $line]
}
set Number_of_hold_violations $count
close $report_file

#---------------------------------find number of instance -----------------------------------------------


set pattern {Num of gates}
set report_file [open $OutputDirectory/$DesignName.results r]
while {[gets $report_file line] != -1} {
  if {[regexp -all -- $pattern $line]} {
    set Instance_count [lindex [join $line " "] 4 ]
    #puts "pattern \"$pattern\" found at line \"$line\""
    break
  } else {
    continue
  }
}
close $report_file


puts "DesignName is \{$DesignName\}"
puts "time_elapsed_in_sec \{$time_elapsed_in_sec\}"
puts "Instance_count is \{$Instance_count\}"
puts "worst_negative_setup_slack is \{$worst_negative_setup_slack\}"
puts "Number_of_setup_violations is \{$Number_of_setup_violations\}"
puts "worst_negative_hold_slack \{$worst_negative_hold_slack\}"
puts "Number_of_hold_violations is \{$Number_of_hold_violations\}"
puts "worst_RAT_slack \{$worst_RAT_slack\}"
puts "Number_output_violations is \{$Number_output_violations\}"

puts "\n"
puts "              ----------------------------PRELAYOUT TIMING RESULTS------------------------                  "

set formatStr {%15s%15s%15s%15s%15s%15s%15s%15s%15s}

puts [format $formatStr "----------" "-------" "--------------" "---------" "---------" "--------" "--------" "-------" "-------"] 
puts [format $formatStr "DesignName" "RunTime" "Instance Count" "WNS Setup" "FEP Setup" "WNS Hold" "FEP Hold" "WNS RAT" "FEP RAT"]
puts [format $formatStr "----------" "-------" "--------------" "---------" "---------" "--------" "--------" "-------" "-------"] 

foreach design_name $DesignName runtime $time_elapsed_in_sec instance_count $Instance_count wns_setup $worst_negative_setup_slack fep_setup $Number_of_setup_violations wns_hold $worst_negative_hold_slack fep_hold $Number_of_hold_violations wns_rat $worst_RAT_slack fep_rat $Number_output_violations {
  puts [format $formatStr $design_name $runtime $instance_count $wns_setup $fep_setup $wns_hold $fep_hold $wns_rat $fep_rat]
}
puts [format $formatStr "----------" "-------" "--------------" "---------" "---------" "--------" "--------" "-------" "-------"] 
puts "\n"
