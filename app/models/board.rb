class Board < ApplicationRecord
  belongs_to :user
  has_many :ships, through: :user
  validates_presence_of :size
end
