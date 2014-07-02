require 'rails_helper'

feature 'Homepage' do
  before do
    visit '/'
  end
  feature 'header' do
    scenario 'has the navigation links' do
      expect(page).to have_link('SUCollective')
      expect(page).to have_link('About')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Register')
    end

    scenario 'navigation links go to the right place' do
      click_on 'SUCollective'
      expect(current_url).to eq('http://www.example.com/')
    end
  end
end