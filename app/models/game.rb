class Game < ApplicationRecord
  validates_presence_of :turn_number
  has_many :users
  has_many :turns
  has_many :boards, through: :users
  has_many :ships, through: :users
end
