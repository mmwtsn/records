require 'spec_helper'

feature 'Records' do
  # User can search Discogs for an artist
  scenario 'query discogs', js: true do
    search_for('Karenn')
    expect(page).to have_content('Sheworks 004')
  end
 
  # User can save a record from the query response
  scenario 'save records from response', js: true do
    search_for('Karenn')

    # Search should return a result
    expect(page.assert_selector('.record')).to be_true

    # Select first record to save it
    first('.record').click

    # Selected results should save to the database and load
    within('.collection') do
      expect(page.assert_selector('.record')).to be_true
    end
  end

  # Saved records should be visible on load
  scenario 'view all saved records' do
    record = FactoryGirl.create(:record)
    visit root_path

    within('.collection') do
      # Existing results should exist in records collection
      expect(page.assert_selector('.record')).to be_true

      # Each record should have at least a title
      expect(page).to have_content(record.title)
    end
  end

  # User can remove records from their collection because nothing lasts forever
  scenario 'delete a saved record', js: true do
    title = 'A Series of Desecration'
    record = FactoryGirl.create(:record, title: title)

    visit root_path
    click_link 'delete'

    expect(page).to have_no_content(title)
  end
end
