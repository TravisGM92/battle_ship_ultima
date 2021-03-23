# frozen_string_literal: true

class Ship < ApplicationRecord
  validates_presence_of :name, :health
  has_many :cells
  belongs_to :user

  def self.create_ships(data)
    board_size = data[:board].size.split('X').map(&:to_i)
    if board_size[0] <= 10 && board_size[1] <= 10
      2.times do
        ship = Ship.create!(
          name: find_name.shuffle.pop,
          health: (1..5).to_a.shuffle.pop,
          user_id: data[:user].id
        )
        Cell.create_coordinates(ship)
      end
    end
  end

  def self.find_name
    %w(Keith John Tim Tom Tamara Lexi Samantha Sam Josh Miranda Lily Tucker Eli Caleb Melissa Marissa Marc Mark Matt Yusef)
  end
end
