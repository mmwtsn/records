require 'spec_helper'

feature 'Records' do
  scenario 'query discogs', js: true do
    visit root_path

    fill_in 'artist', with: 'Karenn'
    click_button 'search'

    expect(page).to have_content('Sheworks 004')
  end
 
  scenario 'select record from response', js: true do
    visit root_path

    fill_in 'artist', with: 'Karenn'
    click_button 'search'

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
end
