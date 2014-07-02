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
  describe 'logs in correctly' do
    before do
      User.create(email: email, password: password, password_confirmation: password)
    end
    it 'enters correct email and password' do
      user = User.find_by_email(email).try(:authenticate, password)
      expect(user).to eq(User.find_by_email(email))
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

  describe 'logs in incorrectly' do
    before do
      User.create(email: email, password: password, password_confirmation: password)
    end
    it 'enters incorrect email and password' do
      user = User.find_by_email(email).try(:authenticate, 'incorrect')
      expect(user).to eq(false)
    end
  end
end