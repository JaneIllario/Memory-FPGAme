
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog vgafsm.v

#load simulation using mux as the top level simulation module
vsim controlvga

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {controlvga/*}

#set input values using the force command, signal names need to be in {} brackets

force {clock} 1 0ns, 0 1ns -r 2ns

force {start} 0
force {background_done} 0
force {load_done} 0
force {resetn} 0
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns

force {start} 1
force {background_done} 0
force {load_done} 0
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns

force {start} 1
force {background_done} 0
force {load_done} 0
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns

force {start} 0
force {background_done} 1
force {load_done} 0
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 010
run 10ns

force {start} 0
force {background_done} 0
force {load_done} 1
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 100
run 10ns

force {start} 0
force {background_done} 0
force {load_done} 0
force {resetn} 1
force {card_done} 1
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns

force {start} 0
force {background_done} 0
force {load_done} 0
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns

force {start} 0
force {background_done} 1
force {load_done} 0
force {resetn} 1
force {card_done} 0
force {game_over} 0
force {count} 0
force {card_displayed} 000
run 10ns







	