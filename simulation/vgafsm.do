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
vsim -L altera_mf_ver vgafsm

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {vgafsm/*}

#set input values using the force command, signal names need to be in {} brackets

force {clock} 1 0ns, 0 1ns -r 2ns

force {show_game_over_screen} 0
force {start} 0
force {resetn} 0 
force {card_displayed} 010
run 10ns

force {show_game_over_screen} 0
force {start} 1
force {resetn} 1 
force {card_displayed} 010
run 10ns

force {show_game_over_screen} 1
force {start} 0
force {resetn} 1 
force {card_displayed} 010
run 150000000ns