onerror {exit -code 1}
vlib work
vlog -work work Counter_other.vo
vlog -work work Counter_other.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Counter_other_vlg_vec_tst
vcd file -direction Counter_other.msim.vcd
vcd add -internal Counter_other_vlg_vec_tst/*
vcd add -internal Counter_other_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

