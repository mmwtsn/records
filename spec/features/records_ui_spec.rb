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

  scenario 'indicates when results are already saved', js: true do
    search_for('Karenn')

    # Search for Karenn should return results
    expect(page.assert_selector('.record')).to be_true

    # Save first result
    first('.record').click

    # Ensure record was saved to collection
    within('.collection') do
      expect(page.assert_selector('.record')).to be_true
    end

    # Re-run identical search
    search_for('Karenn')

    # Expect first result to already be saved
    within('.results') do
      expect(page.assert_selector('.saved')).to be_true
    end
  end

  scenario 'clears current search results', js: true do
    search_for('Karenn')

    click_button 'clear'

    within('.results') do
      expect(page).to have_no_content('.record')
    end
  end
end
