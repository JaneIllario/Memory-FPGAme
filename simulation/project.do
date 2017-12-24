# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog memory_game.v

#load simulation using mux as the top level simulation module
vsim memory_game

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {memory_game/*}

#set input values using the force command, signal names need to be in {} brackets

force {clk} 1 0ns, 0 1ns -r 2ns



force {resetn} 0
force {right} 0
force {wrong} 0
force {start} 0
run 10ns

force {resetn} 1
force {right} 0
force {wrong} 0
force {start} 1
run 10ns

force {resetn} 1
force {right} 0
force {wrong} 1
force {start} 0
run 10ns

force {resetn} 1
force {right} 0
force {wrong} 1
force {start} 0
run 10ns

force {resetn} 1
force {right} 1
force {wrong} 0
force {start} 0
run 10ns

force {resetn} 1
force {right} 1
force {wrong} 0
force {start} 0
run 10ns

force {resetn} 1
force {right} 1
force {wrong} 0
force {start} 0
run 10ns