set script_path [file normalize [info script]]
set script_dir [file dirname $script_path]

set proj_dir [file dirname $script_dir]
set proj_name [file tail $proj_dir]

create_project $proj_name ./build -part xc7s50csga324-1 -force

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

set_property top triroc_readout_tb [get_filesets sim_1]

update_compile_order -fileset sim_1
