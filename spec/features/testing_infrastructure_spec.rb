# require './app/model/link.rb'

feature 'viewing links' do
    Link.create(url: "www.bbc.co.uk", title: "bbc homepage")
    scenario 'upon visiting the homepage, see list of links' do

      visit('/')

      expect(page.status_code).to eq 200

      within 'ul#links' do
        expect(page).to have_content("bbc homepage")
      end
    end
end
