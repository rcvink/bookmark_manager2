
feature 'homepage' do
  scenario 'see list of links' do
    visit('/')
    Link.create(link: "www.bbc.co.uk")
    expect(page).to have_content(link)
  end
end
