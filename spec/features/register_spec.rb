require 'rails_helper'

feature 'Register' do
  before do
    visit '/'
  end
  scenario 'user registers a new account' do
    email = 'test@test.com'
    password = 'password'
    click_on 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Register'
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_link(email)
  end
end