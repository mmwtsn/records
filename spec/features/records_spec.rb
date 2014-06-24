require 'spec_helper'

feature 'Records' do
  scenario 'query discogs', js: true do
    search_for('Karenn')

    expect(page).to have_content('Sheworks 004')
  end
 
  scenario 'save records from response', js: true do
    search_for('Karenn')

    # Search should return a result
    expect(page.assert_selector('.record')).to be_true

    # Clicking a result should "select" it
    first('.record').click
    expect(page.assert_selector('.selected')).to be_true

    # Selected results should save to the database and load
    within('.collection') do
      expect(page.assert_selector('.record')).to be_true
    end
  end

  scenario 'view all saved records' do
    record = FactoryGirl.create(:record)

    visit root_path

    # Existing results should be visible
    within('.collection') do
      expect(page.assert_selector('.record')).to be_true
    end

    # Saved factory record should be visible
    expect(page).to have_content(record.title)
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
