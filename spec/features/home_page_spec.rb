require 'rails_helper'

RSpec.describe 'Home page' do
   it 'exists' do
     visit('/')
     expect(page).to have_link('About')
  end
  it 'has an About link that redirects to /about' do
    visit('/')
    click_link('About')
    expect(current_path).to eq('/about')
  end
end

RSpec.describe 'Home page' do
  it 'has a Lets play button' do
    visit('/')
    expect(page).to have_button("Let's play")
  end
  describe "Let's play button" do
    it 'when user name given and button hit, redirects to /game' do
      visit('/')
      fill_in :user_name, with: 'George'
      click_button("Let's play")
      expect(current_path).to eq('/game')
    end
  end
end
