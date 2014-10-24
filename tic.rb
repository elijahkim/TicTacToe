require_relative "./Player"

class TicTacToe
  def initialize
    @board = [[" "," "," "],[" "," "," "],[" "," "," "]]
  end

  def show_board
    @board.each do |row|
      puts row.inspect
    end
  end

  def place_input input, player
    input = input
    name = player.name
    @board[input[0]][input[1]] = name
  end

  def check_input?(input)
    in_the_boundries?(input) &&  already_exists?(input)
  end

  def in_the_boundries?(input)
    input[0] < 3 && input[1] < 3
  end

  def already_exists?(input)
    @board[input[0]][input[1]] == " "
  end

  def won?(player)
    horizontal?(player)||vertical?(player)||diagonal?(player)
  end

  def spaces_left?
    @board.flatten.include?(" ")
  end

  def horizontal?(player)

    @board.any? do |row|
      check_row(row, player)
    end

#    @board[0][0] == player.name && @board[0][1] == player.name && @board[0][2] == player.name ||
#    @board[1][0] == player.name && @board[1][1] == player.name && @board[1][2] == player.name || @board[2][0] == player.name && @board[2][1] == player.name && @board[2][2] == player.name 
  end

  def vertical?(player)
    @board[0][0] == player.name && @board[1][0] == player.name && @board[2][0] == player.name ||
    @board[0][1] == player.name && @board[1][1] == player.name && @board[2][1] == player.name ||
    @board[0][2] == player.name && @board[1][2] == player.name && @board[2][2] == player.name 
  end

  def diagonal?(player)
    @board[0][0] == player.name && @board[1][1] == player.name && @board[2][2] == player.name ||
    @board[0][2] == player.name && @board[1][1] == player.name && @board[2][0] == player.name 
  end

  def check_row(row, player)
    row.all? { |cell| cell == player.name }
  end

  def check_column

  end
end


