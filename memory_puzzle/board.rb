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

    counter = 0 # [:S, :S]
    while counter < @size * 2
      row_1, col_1 = rand_pos # TODO: edge case same pair of positions on 28 and 29
      row_2, col_2 = rand_pos

      if self[[row_1, col_1]] == nil && self[[row_2, col_2]] == nil
        card_1, card_2 = card_pairs.pop
        self[[row_1, col_1]] = card_1  # card_pairs[0] # => [:S, :S]
        self[[row_2, col_2]] = card_2
        counter += 1
      end
    end
  end
  
  def rand_pos
    [rand(0...@size), rand(0...@size)]
  end

  def card_values
    alpha = ('a'..'z').to_a
    values = []

    @num_pairs.times do
      values << alpha.sample    #TODO check duplicate pairs for face_values?
    end
    return values
  end

  def print
    @grid.each {|row| puts row.join(" ")}
  end

end