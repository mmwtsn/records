require 'spec_helper'

feature 'Records UI' do
  scenario 'is reset between refreshes', js: true do
    visit root_path

    click_button 'search'

    expect(page).to have_content('Search for something!')
  end

  scenario 'only displays vinyl results', js: true do
    visit root_path

    search_for('MPIA3')

    verboten = ['CD', 'File', 'FLAC', 'WAV', 'AIFF', 'MP3']

    verboten.each do |format|
      expect(page).to have_no_content(format)
    end
  end

  scenario 'indicates when records are selected', js: true do
    search_for('Karenn')
    expect(page.assert_selector('.record')).to be_true

    first('.record').click
    expect(page.assert_selector('.selected')).to be_true
  end

  def search_for(artist)
    visit root_path

    fill_in 'artist', with: artist
    click_button 'search'
  end
end
