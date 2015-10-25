require 'sinatra'
require_relative"web_function_tic_tac_toe.rb"
board_positions_array=board_position_array()
get '/board' do 
	erb :board
end

post '/board' do
	player1 = params[:choice].upcase
	player2 = player2_marker(player1)
	
erb :move ,:locals => {:player1 => params[:choice].upcase, :player2 => player2, :board => board_positions_array}

end