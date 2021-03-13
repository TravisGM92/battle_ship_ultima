class Coordinates

  def initialize(data)
    @ship = data[:ship]
    @board_size = data[:board].size.split('X').map(&:to_i)
    @letters_available = ('A'..'Z').to_a[0..@board_size[1]]
    @numbers_available = (1..@board_size[0]).to_a
  end

  def valid_coords
    if Cell.all.empty?
      first = first_coord
      if @ship.health == 1
        first
      else
        find_next_coords(first, 'horz')
      end
    else
      find_empty_cells
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
      require "pry"; binding.pry
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

  def find_empty_cells
    require "pry"; binding.pry
  end
end
