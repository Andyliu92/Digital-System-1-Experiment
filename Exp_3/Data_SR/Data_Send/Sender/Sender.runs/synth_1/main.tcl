# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_param simulator.modelsimInstallPath W:/Program%20Files/modelsim/win64
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.cache/wt} [current_project]
set_property parent.project_path {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/freq_div.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/ten.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/main.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/counter10.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/flip_flops.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/Shift Registers.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/Comb_circuit.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/mux2to1.v}
  {D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/Exp_3/Data_SR/Data_Send/Sender/Sender.srcs/sources_1/new/SR_NS_C.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/DigilentBasys3.xdc}}
set_property used_in_implementation false [get_files {{D:/Study/01 NJU Courses/18001300 Digital_System_Exp_1/DigilentBasys3.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top main -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
