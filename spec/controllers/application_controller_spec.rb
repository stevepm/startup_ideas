require 'rails_helper'

describe ApplicationController do
  let (:email) { 'test@test.com' }
  let (:password) { 'password123' }
  let (:user) { User.create(email: email, password: password, password_confirmation: password) }
  it 'can test user methods' do
    controller.login(user)
    expect(session[:user]).to eq(user.id)
    expect(controller.logged_in?).to eq(true)
    expect(controller.current_user).to eq(user)
    controller.logout
    expect(session[:user]).to eq(nil)
  end
end