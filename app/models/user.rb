# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name
  has_many :ships
  has_one :board
end
