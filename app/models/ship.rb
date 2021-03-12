class Ship < ApplicationRecord
  validates_presence_of :name, :health
  has_many :cells
  belongs_to :user
end
