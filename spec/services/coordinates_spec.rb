require 'rails_helper'

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    data = {
      ship: ship,
      board: board
    }
    @coords = Coordinates.new(data)
  end
  it 'instantiates a Coordinates class' do
    expect(@coords).to be_a(Coordinates)
  end
  it '.first_coord' do
    available_letters = ('A'..'K').to_a
    letters_outside_range = ('L'..'Z').to_a
    first_coordinate = @coords.first_coord
    expect(first_coordinate).to be_a(String)
    expect(first_coordinate[1..-1].to_i <= 10).to eq(true)
    expect(available_letters.include?(first_coordinate[0])).to eq(true)
    expect(letters_outside_range.include?(first_coordinate[0])).to eq(false)
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    data = {
      ship: ship,
      board: board
    }
    @coords = Coordinates.new(data)
  end
  it '.determine_direction' do
    options = %w[horz vert]
    expect(options.include?(@coords.determine_direction)).to eq(true)
  end
  it '.find_next_up_coords' do
    coordinates = @coords.find_next_up_coords(['K1'])
    coordinates.each_with_index do |coord, index|
      if index == 0
        expect(coord).to eq('K1')
      elsif index == 1
        expect(coord).to eq('J1')
      else
        expect(coord).to eq('I1')
      end
      expect(coord).to be_a(String)
    end
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    data = {
      ship: ship,
      board: board
    }
    @coords = Coordinates.new(data)
  end
  it '.find_next_down_coords' do
    coordinates = @coords.find_next_down_coords(['A1'])
    coordinates.each_with_index do |coord, index|
      if index == 0
        expect(coord).to eq('A1')
      elsif index == 1
        expect(coord).to eq('B1')
      else
        expect(coord).to eq('C1')
      end
      expect(coord).to be_a(String)
    end
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
    @user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: @user.id)
    board = Board.create!(user_id: @user.id, size: '10X10')
    @data = { ship: ship, board: board }
    @coords = Coordinates.new(@data)
  end
  it '.first_coord with Cells being used' do
    ('A'..'J').to_a.each do |letter|
      x = 1
      y = 2
      if letter == 'A'
        10.times do
          Cell.create!(coordinate: "#{letter}#{y}", state: 'S', ship_id: @data[:ship].id)
          y += 1
        end
      else
        10.times do
          Cell.create!(coordinate: "#{letter}#{x}", state: 'S', ship_id: @data[:ship].id)
          x += 1
        end
      end
    end
    expect(@coords.first_coord).to eq('A1')
  end

  it '.used_cells' do
    ship = Ship.create!(name: 'Leslie', health: 4, user_id: @user.id)
    expect(@coords.used_cells).to be_empty
    Cell.create!(coordinate: 'B1', state: 'S', ship_id: ship.id)
    expect(@coords.used_cells).to_not be_empty
    expect(@coords.used_cells).to eq(['B1'])
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    data = { ship: ship, board: board }
    @coords = Coordinates.new(data)
  end
  it '.find_next_left_coords()' do
    expect(@coords.find_next_left_coords(['A3'])).to eq(%w[A3 A2 A1])
  end
  it '.find_next_right_coords()' do
    expect(@coords.find_next_right_coords(['A1'])).to eq(%w[A1 A2 A3])
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    data = { ship: ship, board: board }
    @coords = Coordinates.new(data)
  end
  it '.vertical_coordinates()' do
    expect(@coords.vertical_coordinates('J1')).to eq(%w[J1 I1 H1])
    expect(@coords.vertical_coordinates('A1')).to eq(%w[A1 B1 C1])
  end
  it 'horizontal_coordinates()' do
    expect(@coords.horizontal_coordinates('J10')).to eq(%w[J10 J9 J8])
    expect(@coords.horizontal_coordinates('J1')).to eq(%w[J1 J2 J3])
  end
end

RSpec.describe 'Coordinates' do
   it '.valid_coords' do
     user = User.create!(name: 'Dudeness')
     ship = Ship.create!(name: 'The Ship', health: 1, user_id: user.id)
     board = Board.create!(user_id: user.id, size: '10X10')
     data = { ship: ship, board: board }
     coords = Coordinates.new(data)
     expect(coords.valid_coords).to be_an(Array)
     expect(coords.valid_coords[0]).to be_a(String)
  end
end
