class Ship < ApplicationRecord
  validates_presence_of :name, :health
  has_many :cells
  belongs_to :user

  def self.create_ships(data)
    board_size = data[:board].size.split('X').map(&:to_i)
    if board_size[0] <= 10 && board_size[1] <= 10
      2.times do
        ship = Ship.create!(
          name: Faker::Name.first_name,
          health: (1..5).to_a.shuffle.pop,
          user_id: data[:user].id
        )
        Cell.create_coordinates(ship)
      end
    end
  end
end
