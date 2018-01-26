feature 'Sign up' do
  before(:each) do
    visit('/')
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: '0000'
  end

  context 'successfully' do
    before(:each) do
      fill_in 'password_confirmation', with: '0000'
      click_button 'Submit'
    end

    scenario 'sign up redirects user to links page' do
      expect(page).not_to have_content("Password")
    end

    scenario 'user can see a welcome message and their email' do
      expect(page).to have_content("Welcome, test@gmail.com to the Bookmarks Manager")
    end

    scenario 'user count is increased' do
      expect(User.all.count).to eq(1)
    end
  end

  context 'unsuccessfully' do
    before(:each) do
      fill_in 'password_confirmation', with: '1111'
      click_button 'Submit'
    end

    scenario 'user count is not increased' do
      expect(User.all.count).to eq(0)
    end
  end


end
