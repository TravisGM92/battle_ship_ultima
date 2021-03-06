# frozen_string_literal: true

class Cell < ApplicationRecord
  validates_presence_of :coordinate, :state
  belongs_to :ship

  def self.create_coordinates(ship)
    coords = Coordinates.new({ ship: ship, user: ship.user, board: ship.user.board })
    valid_coords = coords.valid_coords
    valid_coords.each do |coordinate|
      Cell.create!(coordinate: coordinate, state: 'S', ship_id: ship.id)
    end
  end
end
