# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'validations' do
    it { should validate_presence_of :size }
  end
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many(:ships).through(:user) }
  end
end
