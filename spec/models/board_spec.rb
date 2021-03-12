require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many(:ships).through(:user) }
  end
end
