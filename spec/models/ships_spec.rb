# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ship, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :health }
  end

  describe 'relationships' do
    it { should have_many :cells }
    it { should belong_to :user }
  end
end

RSpec.describe Ship, type: :model do
  describe 'methods' do
    it '.create_ships()' do
      user = User.create!(name: 'La Dude')
      board = Board.create!(user_id: user.id, size: '10X10')
      data = {
        board: board,
        user: user
      }
      expect(Ship.all).to be_empty
      expect(Ship.create_ships(data)).to eq(2)
      expect(Ship.all.count).to eq(2)
    end
  end
end
