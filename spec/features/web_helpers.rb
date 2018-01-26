def sign_up
  visit('/')
  fill_in 'email', with: 'test@gmail.com'
  fill_in 'password', with: '0000'
  fill_in 'password_confirmation', with: '0000'
  click_button 'Submit'
end
