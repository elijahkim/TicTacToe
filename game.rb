require_relative "./player"
require_relative "./tic"

class Game
  attr_reader :player_one, :player_two
  def initialize
    @player_one = Player.new("X")
    @player_two = Player.new("O")
    @board = TicTacToe.new
  end

  def play
    loop do
      turn(player_one)
      check_win(player_one)
      check_tie
      turn(player_two)
      check_win(player_two)
      check_tie
    end
  end

  private

  def check_win(player)
    if @board.won?(player)
      puts "#{player.name} wins!"
      exit
    end
  end

  def check_tie
    if !@board.spaces_left?
      puts "it was a tie"
      exit
    end
  end

  def turn(player)
    input = player.get_input(player.name)
    if @board.check_input?(input)
      @board.place_input input, player
      @board.show_board
    else
      puts "sorry that is invalid"
      turn(player)
    end

  end
end

game = Game.new
game.play

