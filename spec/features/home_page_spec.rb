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
