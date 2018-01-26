feature 'adding links' do
  scenario 'add one link' do
    sign_up
    visit '/links/new'
    fill_in 'title', with: 'bbc'
    fill_in 'url', with: 'www.bbc.com'
    click_button 'Submit'
    expect(page).to have_content("www.bbc.com")
  end
end
