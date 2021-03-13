require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valiations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :ships }
    it { should have_one :board }
  end
end
