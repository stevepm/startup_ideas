module UserSupport
  def register(email = 'test@example.com', password = 'password123', password_confirmation = 'password123')
    visit '/'
    click_on 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Register'
  end

  def login(email = 'test@example.com', password = 'password123')
    visit '/'
    click_on 'Log in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def log_out
    click_on 'Log out'
  end
end