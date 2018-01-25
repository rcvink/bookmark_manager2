feature 'Sign up page' do
  scenario 'User can be redirected to links page' do
    visit('/')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '0000'
    click_button 'Submit'
    expect(page).not_to have_content("Password")
  end

  # scenario 'user can see a welcome message' do
  #   visit('/')
  #   fill_in 'email', with: 'test@gmail.com'
  #   fill_in 'password', with: '0000'
  #   click_button 'Submit'
  #   expect(page).to have_content("Welcome")
  # end

  scenario 'user can see a welcome message and their email' do
    visit('/')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '0000'
    click_button 'Submit'
    expect(page).to have_content("Welcome, test@gmail.com to the Bookmarks Manager")
  end

  scenario 'user can see a counter' do
    visit('/')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '0000'
    click_button 'Submit'
    expect(User.all.count).to eq(1)
  end

end
