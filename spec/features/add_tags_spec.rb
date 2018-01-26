feature 'adding tags' do
  before(:each) do
    sign_up
    visit '/links/new'
    fill_in 'title', with: 'NASA'
    fill_in 'url', with: 'www.nasa.gov'
  end

  scenario 'add one tag to a link' do
    fill_in 'tag', with: 'science'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:label)).to include('science')
  end

  scenario 'add two tags to a link' do
    fill_in 'tag', with: 'science, physics'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:label)).to include('science')
    expect(link.tags.map(&:label)).to include('physics')
  end
end
