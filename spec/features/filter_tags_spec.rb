feature 'tags' do
  scenario 'filter links by tag' do
    sign_up
    visit '/links/new'
    fill_in 'title', with: 'soap'
    fill_in 'url', with: 'www.soap.org'
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    visit 'tags/bubbles'
    expect(page).to have_content('bubbles')
  end
end
