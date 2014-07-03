require 'rails_helper'

feature 'Register' do
  scenario 'user registers a new account' do
    register
    expect(page).to have_content("Successfully registered")
    expect(page).to have_link('test@example.com')
    expect(page).to have_link('Log out')
    log_out
    expect(page).to_not have_link('test@example.com')
    expect(page).to_not have_link('Log out')
  end
end