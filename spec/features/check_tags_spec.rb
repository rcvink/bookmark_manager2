feature 'tags' do
  scenario 'filter links by tag' do
    visit '/links/new'
    fill_in 'title', with: 'soap'
    fill_in 'url', with: 'www.soap.org'
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    visit 'tags/bubbles'
    expect(page).to have_content('soap')
  end

  scenario 'empty' do
    visit '/links/new'
    fill_in 'title', with: 'soap'
    fill_in 'url', with: 'www.soap.org'
    click_button 'Submit'
    visit 'tags/bubbles'
    expect(page).to_not have_content('soap')
  end
end
