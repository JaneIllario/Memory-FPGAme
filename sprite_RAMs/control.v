`timescale 1ns / 1ns
module control(
    // inputs
  	input start, 				// from switch/ key
  	input resetn,				// from switch/key
	input clk,
  	input next_card, 			// from data path
  	input game_over,		// from data path
  	output reg output_correct_answer,  // going to data path
  	output reg next_card_output,// going to data path
  	output reg analyse
  	// outputs
    );
  reg [2:0] current_state, next_state; 
    
    localparam  
    // define states 
    	START_GAME = 3'd0,		
  		CARD_ONE   = 3'd1,
  		CARD_TWO   = 3'd2,
  		ANALYZE    = 3'd3,
  		RIGHT      = 3'd4,
  		WRONG      = 3'd5,
      FINISH 		= 3'd6;
    
    // Next state logic aka our state table
    always@(*)
    begin: state_table 
		case (current_state)
			// define state transitions
			START_GAME: next_state= start ? CARD_ONE : START_GAME;
			CARD_ONE: next_state = next_card ? CARD_TWO : CARD_ONE;// while next_card is 0 stay on card one
			CARD_TWO: next_state = next_card ? ANALYZE : CARD_TWO;// while next_card is 0 stay on card two
			ANALYZE: next_state = game_over ? FINISH: RIGHT;
			RIGHT: next_state = CARD_TWO;
			FINISH: next_state= START_GAME; 
			default:	next_state=START_GAME;
		endcase
    end
   

    always @(*)
    begin: enable_signals
        // By default make all our signals 0
       
			output_correct_answer=1'b0;
			next_card_output=1'b0;
			analyse=1'b0;
			
			
        case (current_state)
    			// what ahppens in all the states
          START_GAME:begin
          // will dispay start screen when visuals are added
          end
          CARD_ONE:begin
            next_card_output=1'b1;// output first card
          end
          CARD_TWO:begin
          next_card_output=1'b1;// output next card
          output_correct_answer=1'b1;// output right answer
          end
          ANALYZE:begin
            analyse=1'b1;// determine if the player made the right decision 
          end
          RIGHT:begin
            // in the future will keep track of number of right answers in a row with a counter
          end
          FINISH:begin
            // will disaply end of game screen before game restarts
          end
        endcase
    end // enable_signals
   
    // current_state registers
    always@(posedge clk)
    begin: state_FFs
        if(!resetn)
            current_state <= START_GAME;
        else
            current_state <= next_state;
    end 
endmodule