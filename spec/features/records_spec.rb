require 'spec_helper'

feature 'Records' do
  scenario 'query discogs', js: true do
    search_for('Karenn')

    expect(page).to have_content('Sheworks 004')
  end
 
  scenario 'select record from response', js: true do
    search_for('Karenn')

    expect(page.assert_selector('.record')).to be_true

    first('.record').click
    expect(page.assert_selector('.selected')).to be_true
  end

  scenario 'save record from response' do
    pending # User can save their selection to the database
  end

  scenario 'view all saved records' do
    pending # User can see records they have saved to their collection
  end

  scenario 'delete a saved record' do
    pending # User can remove a record form their collection
  end

  scenario 'view a record in their collection' do
    pending # User can click on a record to see more information about it
  end

  def search_for(artist)
    visit root_path

    fill_in 'artist', with: artist
    click_button 'search'
  end
end
