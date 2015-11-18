require 'sinatra'
require_relative "TTTFunctions.rb"

#variable initializing a new instance of class TTTgame
#passing in board, player1, player2, and current_player. Player1 is by default.
game = TTTgame.new(@board, "", "",1,"")


get '/tictactoe' do
	erb :Tictactoe_board1, :locals => {:board => game.board,
									   :message => "Let's play some tic tac toe!", 
									   :message2 => "Please Pick your opponent, Human or Computer ?", 
									   :message3 => "Please Pick X or O ?", 
									   :message4 => "",
									   :mindchanger => ""}
end


post '/tictactoe' do
  game.player1 = params[:selection].upcase
  player_marker = game.current_player()
  game.player2 = game.p2(game.player1)
    erb :Tictactoe_board2, :locals => {:current => game.current, 
									   :message => "Player 1 is #{game.player1} and Player 2 is #{game.player2}.",
									   :message5 => "Pick a Square Player #{player_marker} ", 
									   :board => game.board}
  
end

post '/board' do
	game.type = params[:gamemode]
    choice = params[:choice].to_i
	player_marker = game.current_player()
	
		
		if game.square_valid?(choice, game.board) == true
	      game.board[choice - 1] = player_marker
			
			if game.is_board_full?(game.board) == false && game.win(game.board) == false
				  game.current = game.switch_players()
				  
			    if game.type == "gjh"
			     	game.random_select(game.board)
			     	if game.is_board_full?(game.board) == false && game.win(game.board) == false
				      game.current = game.switch_players()
				      erb :Tictactoe_board2, :locals => { :current => game.current, 
			                                              :message => "", 
			 								              :board => game.board}
			        
			        elsif game.win(game.board) == true
				       erb :gamewon, :locals => {:message => "Player #{player_marker} has won.", 
										         :message6 => "Would you like to play again?",
										         :board => game.board }
			
			        else game.is_board_full?(game.board) == true
			          erb :gamewon, :locals => {:message => "Players have tied.", 
				                      :message6 => "Would you like to play again?",
				                      :board => game.board }
			        end
			    end
				
	   
		  erb :Tictactoe_board2, :locals => { :current => game.current, 
			                                :message => "", 
			 								:message5 => "",
			 								:board => game.board }
	   
	    elsif game.win(game.board) == true
	    	erb :gamewon, :locals => {:message => "Player #{player_marker} has won.", 
										  :message6 => "Would you like to play again?",
										  :board => game.board }
	    
        else 
        	erb :gamewon, :locals => {:message => "Players have tied.", 
				                      :message6 => "Would you like to play again?",
				                      :board => game.board }

	    end 
	    else 
	    	erb :Tictactoe_board2, :locals => { :current => game.current, 
			                                    :message => "Square taken, Please pick again.", 
			 								    :message5 => "",
			 								    :board => game.board }                           
    
    end
end

# post '/board' do
# 	choice = params[:choice].to_i
# 	player_marker = game.current_player()
	
# 	if game.square_valid?(choice, game.board) == true
# 		game.board[choice - 1] = player_marker
			
# 			if game.is_board_full?(game.board) == false && game.win(game.board) == false
# 				game.current = game.switch_players()
# 				erb :Tictactoe_board2, :locals => { :current => game.current, 
# 					                                :message => "Player #{player_marker} has chosen square #{params[:choice]}.", 
# 					                                :message5 => "Pick a Square Player #{game.current}",
# 					                                :board => game.board }
			
# 			elsif game.win(game.board) == true
# 				erb :gamewon, :locals => {:message => "Player #{player_marker} has won.", 
# 										  :message6 => "Would you like to play again?",
# 										  :board => game.board }
			
# 			else game.is_board_full?(game.board) == true
# 			erb :gamewon, :locals => {:message => "Players have tied.", 
# 				                      :message6 => "Would you like to play again?",
# 				                      :board => game.board }
# 			end
				
# 	else
# 		erb :Tictactoe_board2, :locals => { :current => game.current, 
# 			                                :message => "Square taken, Please choose again.", 
# 			                                :message5 => "",
# 			                                :board => game.board }
# 	end
#  end


post '/replay' do
	choice = params[:selection]
	game = TTTgame.new(@board, "", "",1,"")
		if choice == "y"
			redirect to('/tictactoe')
			
		else
			erb :Tictactoe_board1, :locals => {:board => game.board,
											   :message => "Thanks for playing", 
											   :message2 => "", 
											   :message3 => "See You Next Time",
	 										   :message4 => " ",
		 									   :mindchanger => "If you change your mind then Please pick X or O"}
		end

 end