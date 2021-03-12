require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :turn_number }
  end

  describe 'relationships' do
    it { should have_many :users }
    it { should have_many(:boards).through(:users) }
    it { should have_many(:ships).through(:users) }
  end
end

RSpec.describe Game, type: :model do
  describe 'instantiation' do
    it 'creates a game' do
      game = Game.create!(turn_number: 0)
      expect(game).to be_a(Game)
    end
  end

  describe 'methods' do
    # it '.start_game()' do
    #   game_data = {
    #     user_name: 'George',
    #     board_size: '10X10',
    #     difficulty: 'easy'
    #   }
    #   game = Game.create!(turn_number: 0)
    #
    #   expect(User.all).to be_empty
    #   expect(User.where(name: 'George').name).to eq('George')
    #   start_game = game.start_game(game_data)
    #   expect(User.all).to_not be_empty
    #   expect(User.all.count).to eq(2)
    #
    #   User.all.each do |user|
    #     expect(user.ships).to_not be_empty
    #     expect(user.board).to_not be_empty
    #     expect(user.board.cells).to_not be_empty
    #     expect(user.ships.cells).to_not be_empty
    #   end
    # end
  end
end
