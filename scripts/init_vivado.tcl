set script_path [file normalize [info script]]
set script_dir [file dirname $script_path]

set proj_dir [file dirname $script_dir]
set proj_name [file tail $proj_dir]

set proj_fpga xc7s50csga324-1
# set proj_fpga xc7a35tcpg236-1	Basys3

set proj_sim_default_top interface_tb


create_project $proj_name ./build -part $proj_fpga -force


foreach f [glob -nocomplain ./rtl/src/*] {
    add_files $f
}

foreach f [glob -nocomplain ./rtl/sim/*] {
    add_files -fileset sim_1 $f
}

foreach xdc_file [glob -nocomplain ./constraints/*.xdc] {
    add_files $xdc_file
    set_property FILE_TYPE XDC [get_files $xdc_file]
    set_property USED_IN_SYNTHESIS true [get_files $xdc_file]
    set_property USED_IN_IMPLEMENTATION true [get_files $xdc_file]
}


update_compile_order -fileset sources_1

set current_top [get_property top [get_filesets sim_1]]

if { $current_top eq "" } {
    set_property top $proj_sim_default_top [get_filesets sim_1]
}

update_compile_order -fileset sim_1

launch_simulation