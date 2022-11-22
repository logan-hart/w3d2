require_relative

class Board
  def initialize(size=4)
    @size = size
    @grid = Array.new(size) { Array.new(size, nil) }  # TODO: Check board dimensions
    @num_pairs = (size * size) / 2
  end

  def [](pos) 
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def populate
  end

  def card_values
    alpha = ('a'..'z').to_a
    values = []

    @num_pairs.times do
      values << alpha.sample
    end
    return values
  end

end