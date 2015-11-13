require 'sinatra'
require_relative"web_function_tic_tac_toe.rb"


game = TicTacToe.new()

get '/board' do 
	erb :board, :locals => {:player1 => "", :player2 => "", :board => game.board}
end

post '/board' do
	# game.p1 = params[:choice].upcase
	# game.p2 = player2_marker(game.p1)
	
erb :move, :locals => {:player1 => game.p1, :player2 => game.p2, :board => game.board}

end

# post '/move' do
# erb :move

# end


# post '/make_move' do
	# erb :move, :locals => {:player1 => params[:choice].upcase, :player2 => player2, :board => board_positions_array}  



# end