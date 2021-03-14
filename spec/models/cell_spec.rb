# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cell, type: :model do
  describe 'validations' do
    it { should validate_presence_of :coordinate }
    it { should validate_presence_of :state }
  end

  describe 'relationships' do
    it { should belong_to :ship }
  end

  describe 'methods' do
    it '.create_coordinates()' do
      user = User.create!(name: 'George')
      ship = Ship.create!(name: 'Georgina', health: '2', user_id: user.id)
      Board.create!(user_id: user.id, size: '10X10')
      coords = Cell.create_coordinates(ship)
      expect(coords).to be_an(Array)
      coords.sort.each do |coord|
        expect(coord).to be_a(String)
      end
    end
  end
end
