class Cell < ApplicationRecord
  validates_presence_of :coordinate, :state
  belongs_to :ship
end
