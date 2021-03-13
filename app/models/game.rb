class Game < ApplicationRecord
  validates_presence_of :turn_number
  has_many :users
  has_many :turns
  has_many :boards, through: :users
  has_many :ships, through: :users

  def start_game(data)
    user = User.create!(name: data[:user_name], game_id: Game.last.id)
    computer = User.create!(name: 'COMPUTER', game_id: Game.last.id)
    prep_user({user: user, board_size: data[:board_size]})
    prep_computer
  end

  def prep_user(data)
    user_board = Board.create!(user_id: data[:user].id, size: data[:board_size])
    Ship.create_ships({user: data[:user], board: user_board})
  end
end
