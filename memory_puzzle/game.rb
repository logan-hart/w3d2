require_relative 'board'
require_relative 'card'

class Game
  def initialize
    @board = Board.new
    @prev_guessed = nil
  end

  def get_pos
    p 'Enter position with row, col format example "1 2"'
    pos = gets.chomp.split(' ').map(&:to_i)  # TODO: question add position to prev_guessed?
  end

  def play
    until @board.won?
      system("clear")
      @board.render
      make_guess(self.get_pos)

    end
  end

  def make_guess(pos)
    @board[pos].reveal
    system("clear")
    @board.render

    if @prev_guessed.nil?
      @prev_guessed = @board[pos]
    else
      if @board[pos].to_s != @prev_guessed.to_s
        puts 'try again'
        sleep(2)
        @prev_guessed.hide
        @board[pos].hide
        @board.render
      else
        @prev_guessed = nil
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play
end