require 'rails_helper'

RSpec.describe 'Coordinates' do
  before(:each) do
    user = User.create!(name: 'George')
    ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
    board = Board.create!(user_id: user.id, size: '10X10')
    @data = {
      ship: ship,
      board: board
    }
  end
  it 'instantiates a Coordinates class' do
    coords = Coordinates.new(@data)
    expect(coords).to be_a(Coordinates)
  end
  it '.first_coord' do
    available_letters = ('A'..'K').to_a
    letters_outside_range = ('L'..'Z').to_a
    coords = Coordinates.new(@data)
    first_coordinate = coords.first_coord
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
    @data = {
      ship: ship,
      board: board
    }
  end
  it '.determine_direction' do
    coords = Coordinates.new(@data)
    options = %w(horz vert)
    expect(options.include?(coords.determine_direction)).to eq(true)
  end
  it '.find_next_up_coords' do
    coords = Coordinates.new(@data)
    coordinates = coords.find_next_up_coords(['K1'])
    coordinates.each_with_index do |coord, index|
      if index == 0
        expect(coord).to be_a(String)
        expect(coord).to eq('K1')
      elsif index == 1
        expect(coord).to be_a(String)
        expect(coord).to eq('J1')
      else
        expect(coord).to be_a(String)
        expect(coord).to eq('I1')
      end
    end
  end
end

RSpec.describe 'Coordinates' do
  before(:each) do
  user = User.create!(name: 'George')
  ship = Ship.create!(name: 'La Ship', health: 3, user_id: user.id)
  board = Board.create!(user_id: user.id, size: '10X10')
  @data = {
    ship: ship,
    board: board
  }
end
  it '.find_next_down_coords' do
    coords = Coordinates.new(@data)
    coordinates = coords.find_next_down_coords(['A1'])
    coordinates.each_with_index do |coord, index|
      if index == 0
        expect(coord).to be_a(String)
        expect(coord).to eq('A1')
      elsif index == 1
        expect(coord).to be_a(String)
        expect(coord).to eq('B1')
      else
        expect(coord).to be_a(String)
        expect(coord).to eq('C1')
      end
    end
  end
end
