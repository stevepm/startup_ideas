require 'rails_helper'

feature 'Log in' do
  let (:email) {'test@example.com'}
  let (:password) {'password123'}
  before do
    User.create(email: email, password: password, password_confirmation: password)
  end
  scenario 'User logs in and out' do
    login
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_link(email)
    expect(page).to have_link('Log out')
    log_out
    expect(page).to_not have_link(email)
    expect(page).to_not have_link('Log out')
  end

  scenario 'User enters wrong password' do
    visit '/'
    click_link 'Log in'
    click_button 'Log in'
    expect(page).to have_content('Username/Password was incorrect')
  end
end