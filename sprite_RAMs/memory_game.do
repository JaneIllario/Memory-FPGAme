# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog memory_game.v

#load simulation using mux as the top level simulation module
vsim control

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {control/*}

#set input values using the force command, signal names need to be in {} brackets

force {clk} 1 0ns, 0 1ns -r 2ns

force {start} 1
force {resetn} 1
force {next_card} 0
force {game_over} 0
run 2ns

force {start} 0
force {resetn} 1
force {next_card} 1
force {game_over} 0
run 2ns


force {start} 0
force {resetn} 1
force {next_card} 0
force {game_over} 0
run 2ns

force {start} 0
force {resetn} 1
force {next_card} 1
force {game_over} 0
run 2ns


force {start} 0
force {resetn} 1
force {next_card} 0
force {game_over} 0
run 2ns

force {start} 0
force {resetn} 1
force {next_card} 1
force {game_over} 0
run 2ns

force {start} 0
force {resetn} 1
force {next_card} 1
force {game_over} 0
run 2ns

force {start} 0
force {resetn} 1
force {next_card} 0
force {game_over} 1
run 2ns


force {start} 0
force {resetn} 1
force {next_card} 0
force {game_over} 1
run 2ns
