require 'rails_helper'

RSpec.describe 'About page' do
   it 'has a link to redirect back home' do
     visit('/about')
     expect(page).to have_link('Home')
     click_link('Home')
     expect(current_path).to eq('/')
  end
end
