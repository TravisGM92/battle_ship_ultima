# frozen_string_literal: true

class Coordinates
  def initialize(data)
    @ship = data[:ship]
    @board_size = data[:board].size.split('X').map(&:to_i)
    @letters_available = ('A'..'Z').to_a[0..@board_size[1]]
    @alphabet = ('A'..'Z').to_a
    @numbers_available = (1..@board_size[0]).to_a
  end

  def valid_coords
    @ship.health == 1 ? [first_coord] : find_next_coordinates(first_coord)
  end

  def find_next_coordinates(first)
    determine_direction == 'vert' ? vertical_coordinates(first) : horizontal_coordinates(first)
  end

  def determine_direction
    %w[vert horz].shuffle.pop
  end

  def vertical_coordinates(first)
    if (@alphabet.index(first[0]) + 1) + @ship.health < @board_size[1]
      find_next_down_coords([first])
    else
      find_next_up_coords([first])
    end
  end

  def horizontal_coordinates(first)
    if first[1..].to_i + (@ship.health - 1) < @board_size[0]
      find_next_right_coords([first])
    else
      find_next_left_coords([first])
    end
  end

  def find_next_right_coords(cells)
    row = cells[0][0]
    if cells.length == @ship.health
      cells
    else
      find_next_right_coords(cells + ["#{row}#{cells[-1][1..].to_i + 1}"])
    end
  end

  def find_next_left_coords(cells)
    row = cells[0][0]
    if cells.length == @ship.health
      cells
    else
      find_next_left_coords(cells + ["#{row}#{cells[-1][1..].to_i - 1}"])
    end
  end

  def find_next_down_coords(cells)
    column = cells[0][1..]
    if cells.length == @ship.health
      cells
    else
      find_next_down_coords(cells + ["#{@alphabet[@alphabet.index((cells[-1][0]).to_s) + 1]}#{column}"])
    end
  end

  def find_next_up_coords(cells)
    column = cells[0][1..]
    if cells.length == @ship.health
      cells
    else
      find_next_up_coords(cells + ["#{@alphabet[@alphabet.index((cells[-1][0]).to_s) - 1]}#{column}"])
    end
  end

  def first_coord
    first = "#{@letters_available.shuffle.pop}#{@numbers_available.shuffle.pop}"
    if Cell.all.empty?
      first
    else
      (used_cells.include?(first) ? first_coord : first)
    end
  end

  def used_cells
    @ship.user.ships.flat_map { |ship| ship.cells.map(&:coordinate) }
  end
end
