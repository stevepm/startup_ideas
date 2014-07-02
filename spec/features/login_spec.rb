require 'rails_helper'

feature 'Log in' do
  let (:email) {'test@test.com'}
  let (:password) {'password123'}
  before do
    User.create(email: email, password: password, password_confirmation: password)
  end
  scenario 'User logs in and out' do
    visit '/'
    click_on 'Log in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_link(email)
    expect(page).to have_link('Log out')
    click_on 'Log out'
    expect(page).to_not have_link(email)
    expect(page).to_not have_link('Log out')
  end
end