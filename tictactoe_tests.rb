require_relative "TTTFunctions.rb"

require "minitest/autorun"

class Tictactoe_tests < Minitest::Test



	def test_initialize
		game = TTTgame.new(board_position_array,"","",1) 
		assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9"], game.board)
		assert_equal("",game.p1)
		assert_equal("",game.p2)
		assert_equal("",game.currentplayer)

		end
		
	def test_update_board
		game = TTTgame.new(board_position_array,"","",1) 
		game.board[0] = "X"
		assert_equal(["X", "2", "3", "4", "5", "6", "7", "8", "9"], game.board )
		
		end
		
	def test_update_marker
		game = TTTgame.new(board_position_array,"","",1) 
		game.p1= "X"
		assert_equal("X",game.p1)
	end
	
	def test_valid_move
		choice = 7
		game = TTTgame.new(board_position_array,"","",1) 
		game.board[0] = "X"
		assert_equal(true,game.valid_move?(choice))
		assert_equal(false,game.valid_move?(0))
		assert_equal(false,game.valid_move?(1))
		
		end

	
		
end