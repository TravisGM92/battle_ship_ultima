class Coordinates

  def initialize(data)
    @ship = data[:ship]
    @board_size = data[:board].size.split('X').map(&:to_i)
    @letters_available = ('A'..'Z').to_a[0..@board_size[1]]
    @alphabet = ('A'..'Z').to_a
    @numbers_available = (1..@board_size[0]).to_a
  end

  def valid_coords
    if @ship.health == 1
      used_cells.include?(first_coord) ? valid_coords : [first_coord]
    elsif Cell.all.empty?
      first = first_coord
      @ship.health == 1 ? first : find_next_coords(first, %w(vert horz).shuffle.pop)
    else
      coordinates = find_next_coords(first_coord, %w(vert horz).shuffle.pop)
      used_cells.include?(coordinates) ? valid_coords : coordinates
    end
  end

  def first_coord
    "#{@letters_available.shuffle.pop}#{@numbers_available.shuffle.pop}"
  end

  def find_next_coords(first, direction)
    if direction == 'horz'
      if (first[1..-1].to_i + (@ship.health - 1) < @board_size[0])
        find_next_right_coords([first])
      else
        find_next_left_coords([first])
      end
    else
      if ((@alphabet.index(first[0]) + 1) + @ship.health < @board_size[1])
        find_next_down_coords([first])
      else
        find_next_up_coords([first])
      end
    end
  end

  def find_next_right_coords(cells)
    row = cells[0][0]
    if cells.length == @ship.health
      cells
    else
      find_next_right_coords(cells + ["#{row}#{cells[-1][1..-1].to_i + 1}"])
    end
  end

  def find_next_left_coords(cells)
    row = cells[0][0]
    if cells.length == @ship.health
      cells
    else
      find_next_left_coords(cells + ["#{row}#{cells[-1][1..-1].to_i - 1}"])
    end
  end

  def find_next_down_coords(cells)
    column = cells[0][1..-1]
    if cells.length == @ship.health
      cells
    else
      find_next_down_coords(cells + ["#{@alphabet[@alphabet.index("#{cells[-1][0]}")+1]}#{column}"])
    end
  end

  def find_next_up_coords(cells)
    column = cells[0][1..-1]
    if cells.length == @ship.health
      cells
    else
      find_next_up_coords(cells + ["#{@alphabet[@alphabet.index("#{cells[-1][0]}")-1]}#{column}"])
    end
  end

  def used_cells
    @ship.user.ships.flat_map do |ship|
      ship.cells.map { |cell| cell.coordinate}
    end
  end
end
