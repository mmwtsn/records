module Helpers
  def search_for(artist)
    visit root_path

    fill_in 'artist', with: artist
    click_button 'search'
  end
end
