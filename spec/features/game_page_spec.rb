require 'rails_helper'

RSpec.describe 'Game page' do
  describe "Let's Play button" do
    it 'when hit, redirects to page with 2 boards' do
      visit('/')
      fill_in :user_name, with: 'George'
      click_button("Let's play")
      expect(page).to have_content('Computer board')
      expect(page).to have_content("George's board")
    end
  end
end
