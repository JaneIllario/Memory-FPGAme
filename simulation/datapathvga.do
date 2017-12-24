vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog vgafsm.v

#load simulation using mux as the top level simulation module
vsim datapathvga

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {datapathvga/*}

#set input values using the force command, signal names need to be in {} brackets

force {clock} 1 0ns, 0 1ns -r 2ns
force {startscreencolour} 001
force {card1colour} 010
force {card2colour} 011
force {card3colour} 100
force {card4colour} 101
force {card5colour} 110
force {card6colour} 111
force {card7colour} 000
force {backgroundcolour} 010
force {gameovercolour} 111
	
force {start_movement} 0
force {select} 000
force {resetn} 0
force {display_card} 0
run 10ns

force {start_movement} 0
force {select} 010
force {resetn} 1
force {display_card} 1
run 20ns

force {start_movement} 1
force {select} 011
force {resetn} 1
force {display_card} 0
run 20ns