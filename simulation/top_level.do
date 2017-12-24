
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files

vlog vgafsm.v 
vlog start_screen.v 
vlog game_over.v 
vlog card_1.v 
vlog card_2.v 
vlog card_3.v 
vlog card_4.v 
vlog card_5.v 
vlog card_6.v 
vlog card_7.v 
vlog game_background.v
vlog memory_game.v 
#load simulation using mux as the top level simulation module
vsim -L altera_mf_ver semi_top_memory_game

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {semi_top_memory_game/*}

#set input values using the force command, signal names need to be in {} brackets

force {clk} 1 0ns, 0 1ns -r 2ns

force {resetn} 0 
run 2ns

force {resetn} 1
force {start} 1
run 2ns

force {start} 0
force {wrong} 0
force {right} 1
run 10000000000000000000000000000000000000000000000000000000000000ns
