class TicTacToe

  attr_accessor :board, :p1, :p2, :currentplayer

  def initialize
    @board = board_position_array
    @p1 = ""
    @p2 = ""
    @currentplayer = @p1
  end

  

  def player2_marker(player1)
    if player1 == "X"
      player2 = "O"
    else
      player2 = "X"
    end
  end

  def board_position_array
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def valid_marker?(marker)
    marker == "X" || marker=="O"
  end
 

  def valid_move?(choice)
    if choice >= 1 && choice <= 9 && @board[choice -1] != "X" && @board[choice -1] != "O" 
      true 
    else
      false 
    end
  end

    
  def board_full?(squares)
    board = squares.join(",")
    board =~ (/\d/) ? false : true
  end
  
 
  def win?(board)
    if board[0] == "X" && board[1] == "X" && board[2] == "X" ||
      board[3] == "X" && board[4] == "X" && board[5] == "X" ||
      board[6] == "X" && board[7] == "X" && board[8] == "X" ||
      board[0] == "X" && board[3] == "X" && board[6] == "X" ||
      board[1] == "X" && board[4] == "X" && board[7] == "X" ||
      board[2] == "X" && board[5] == "X" && board[8] == "X" ||
      board[0] == "X" && board[4] == "X" && board[8] == "X" ||
      board[2] == "X" && board[4] == "X" && board[6] == "X" ||
      board[0] == "O" && board[1] == "O" && board[2] == "O" ||
      board[3] == "O" && board[4] == "O" && board[5] == "O" ||
      board[6] == "O" && board[7] == "O" && board[8] == "O" ||
      board[0] == "O" && board[3] == "O" && board[6] == "O" ||
      board[1] == "O" && board[4] == "O" && board[7] == "O" ||
      board[2] == "O" && board[5] == "O" && board[8] == "O" ||
      board[0] == "O" && board[4] == "O" && board[8] == "O" ||
      board[2] == "O" && board[4] == "O" && board[6] == "O"
        true
   else 
       false
    end
  end
 
 
end