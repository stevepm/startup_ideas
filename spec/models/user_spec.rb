require 'rails_helper'

describe User do
  let (:email) {'test@test.com'}
  let (:password) {'password123'}
  describe 'registers correctly' do
    it 'creates a user with correct email and matching passwords' do
      user = User.new(email: email, password: password, password_confirmation: password)
      expect(user.save).to eq(true)
    end
  end

  describe 'registers incorrectly' do
    it 'passwords dont match' do
      user = User.new(email: email, password: password, password_confirmation: 'test')
      expect(user.save).to eq(false)
      expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
      user.password_confirmation = password
      expect(user.save).to eq(true)
    end

    it 'email is not valid' do
      bad_email = 'test@test'
      user = User.new(email: bad_email, password: password, password_confirmation: password)
      expect(user.save).to eq(false)
      expect(user.errors.full_messages).to eq(["Email is invalid"])
      user.email = email
      expect(user.save).to eq(true)
    end
  end
end