require 'spec_helper'

feature 'Records UI' do
  scenario 'prevents empty searches', js: true do
    # Submit empty search
    search_for('')

    # Check for empty search error message
    expect(page).to have_content('Search for something!')
  end

  scenario 'only displays vinyl results', js: true do
    # Define all known non-vinyl Discogs formats
    verboten = ['CD', 'File', 'FLAC', 'WAV', 'AIFF', 'MP3']

    visit root_path
    search_for('MPIA3')

    # Iterate over each format to ensure all results are vinyl
    verboten.each do |format|
      expect(page).to have_no_content(format)
    end
  end

  scenario 'indicates when records are selected', js: true do
    search_for('Karenn')

    # Search for Karenn should return results
    expect(page.assert_selector('.record')).to be_true

    # Click first result and expect UI to update accordingly
    first('.record').click
    expect(page.assert_selector('.selected')).to be_true
  end

  def search_for(artist)
    visit root_path

    fill_in 'artist', with: artist
    click_button 'search'
  end
end
