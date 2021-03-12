require 'rails_helper'

RSpec.describe Cell, type: :model do
  describe 'validations' do
    it { should validate_presence_of :coordinate }
    it { should validate_presence_of :state }
  end

  describe 'relationships' do
    it { should belong_to :ship }
  end
end
