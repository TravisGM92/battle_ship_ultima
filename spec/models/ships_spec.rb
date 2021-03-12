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
