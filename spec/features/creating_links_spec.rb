
feature 'creating a link' do
  scenario 'adding a site address and title to bookmark' do
    visit '/links/new'
    fill_in 'name', with: 'bbc'
    fill_in 'url', with: 'www.bbc.com'
    click_button 'Submit'
    expect(page).to have_content("www.bbc.com")
  end
end
