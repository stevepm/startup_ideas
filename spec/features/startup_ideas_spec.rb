require 'rails_helper'

feature 'Startup ideas' do
  feature 'Adding a new idea' do
    scenario 'registered user adds a new idea' do
      register
      click_on 'Add a new idea'
      click_on 'Submit'
      expect(page).to have_content("Title can't be blank")
      fill_in 'idea[title]', with: 'testing'
      click_button 'Submit'
      expect(current_url).to eq('http://www.example.com/')
      expect(page).to have_link('testing')
      click_on 'testing'
      expect(page).to have_content('testing')
    end
    scenario 'unregistered user tries to add a new idea' do
      visit '/'
      click_on 'Add a new idea'
      expect(page).to have_content('You must log in to add an idea')
    end
  end
end