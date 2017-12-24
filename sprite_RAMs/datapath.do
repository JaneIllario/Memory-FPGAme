# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog memory_game.v

#load simulation using mux as the top level simulation module
vsim datapath

#log all signals and add some signals to waveform window
log {/*}
# add wave {} would add all items in top level simulation module
add wave {datapath/*}

#set input values using the force command, signal names need to be in {} brackets

force {clk} 1 0ns, 0 1ns -r 2ns

force {card_original_0} 0001
force {card_original_1} 0100
force {card_original_2} 0100
force {card_original_3} 0010
force {card_original_4} 0011
force {card_original_5} 0010
force {card_original_6} 0010
force {card_original_7} 0110
force {card_original_8} 0110
force {card_original_9} 0110
force {card_original_10} 0001		 
force {correctness_val[10:0]} 10110100010
force {speed} 1000111100001101000101111111


force {next_card} 0
force {wrong} 0
force {right} 0
force {output_correct_answer} 0
force {analyse}  0
force {resetn} 0
run 10ns


force {next_card} 1 
force {wrong} 0
force {right} 0
force {output_correct_answer} 0
force {analyse} 0
force {resetn} 1
run 10ns

force {next_card} 1
force {wrong} 1
force {right} 0
force {output_correct_answer} 1
force {analyse}  0
force {resetn} 1
run 10ns
	 
force {next_card} 0
force {wrong} 1
force {right} 0
force {output_correct_answer} 0
force {analyse}  1
force {resetn} 1
run 10ns

		 
force {next_card} 1
force {wrong} 0
force {right} 1
force {correctness_val[10:0]} 10110100010
force {output_correct_answer} 1
force {analyse}  0
force {resetn} 1
run 10ns

		 
force {next_card} 0
force {wrong} 0
force {right} 1
force {output_correct_answer} 0
force {analyse}  1
force {resetn} 1
run 10ns

		 
force {next_card} 1
force {wrong} 1
force {right} 0
force {output_correct_answer} 1
force {analyse}  0
force {resetn} 1
run 10ns

	 
force {next_card} 0
force {wrong} 1
force {right} 0
force {output_correct_answer} 0
force {analyse}  1
force {resetn} 1
run 10ns


force {next_card} 1
force {wrong} 0
force {right} 1
force {output_correct_answer} 1
force {analyse}  0
force {resetn} 1
run 10ns
	 
force {next_card} 0
force {wrong} 0
force {right} 1
force {output_correct_answer} 0
force {analyse}  1
force {resetn} 1
run 10ns
