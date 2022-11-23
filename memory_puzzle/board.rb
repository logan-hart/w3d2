require_relative 'card'

class Board
  def initialize(size = 4)
    @size = size
    @grid = Array.new(size) { Array.new(size, nil) }  # TODO: Check board dimensions
    @num_pairs = (size * size) / 2
    populate
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
      card_1 = Card.new(val)
      card_2 = Card.new(val)
      [card_1, card_2]
    end

    counter = 0
    while counter < @size * 2
      rp_1 = rand_pos
      rp_2 = rand_pos
      next if rp_1 == rp_2

      row_1, col_1 = rp_1
      row_2, col_2 = rp_2

      next unless self[[row_1, col_1]].nil? && self[[row_2, col_2]].nil?

      card_1, card_2 = card_pairs.pop
      self[[row_1, col_1]] = card_1 # card_pairs[0] # => [:S, :S]
      self[[row_2, col_2]] = card_2
      counter += 1
    end
  end

  def rand_pos
    [rand(0...@size), rand(0...@size)]
  end

  def card_values
    alpha = ('a'..'z').to_a
    values = []

    @num_pairs.times do
      values << alpha.sample # TODO: check duplicate pairs for face_values?
    end
    values
  end

  def render
    new_grid = [(0...@size).to_a.unshift(' ')]
    @grid.each_with_index do |subArr, i|
      row = [i] # [0,]
      subArr.each do |card|
        row << if card.visible == false        # TODO: Check ==
                 ' '
               else
                 card.to_s
               end
      end
      new_grid << row
    end
    self.print(new_grid)
  end

  def print(output)
    output.each { |row| puts row.join(' ') }
  end

  def won?
    @grid.flatten.all? { |card| card.visible == true }
  end

  def reveal(guess_pos)
    if self[guess_pos].visible == false
      self[guess_pos].reveal
      self[guess_pos].to_s
    end
  end
end
