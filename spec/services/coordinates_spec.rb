require 'rails_helper'

RSpec.describe 'Coordinates' do
  before(:each) do
    @user = User.create!(name: 'George')
    @ship = Ship.create!(name: 'La Ship', health: 3, user_id: @user.id)
    @board = Board.create!(user_id: @user.id, size: '10X10')
  end
  it 'instantiates a Coordinates class' do
    data = {
      ship: @ship,
      board: @board,
    }
    coords = Coordinates.new(data)
    expect(coords).to be_a(Coordinates)
  end
end
