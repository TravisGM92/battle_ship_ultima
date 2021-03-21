class GameController < ApplicationController
  def create
    create_game({user_name: params['user_name']})
    redirect_to('/game')
  end

  def show; end

  private

  def create_game(data)
    game_data = {
      user_name: data[:user_name],
      board_size: '10X10',
      difficulty: 'easy'
    }
    game = Game.create!(turn_number: 0)
    game.start_game(game_data)
  end
end
