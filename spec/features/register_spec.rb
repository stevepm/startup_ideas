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
    fill_in 'Password confirmation', with: password
    click_button 'Register'
    expect(page).to have_content("Successfully registered")
    expect(page).to have_link(email)
    expect(page).to have_link('Log out')
    click_on 'Log out'
    expect(page).to_not have_link(email)
    expect(page).to_not have_link('Log out')
  end
end