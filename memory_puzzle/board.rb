require_relative "card.rb"

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
    card_pairs = card_values.map do |val|
      card = Card.new(val)
      [card, card]
    end

    counter = 0
    while counter < @size * @size
      row_1, col_1 = rand_pos
      if self[row]
  end
  
  def rand_pos
    [rand(0...@size), rand(0...@size)]
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