onerror {exit -code 1}
vlib work
vlog -work work mux41a_assign.vo
vlog -work work mux41a_assign.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.mux41a_assign_vlg_vec_tst
vcd file -direction mux41a_assign.msim.vcd
vcd add -internal mux41a_assign_vlg_vec_tst/*
vcd add -internal mux41a_assign_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
