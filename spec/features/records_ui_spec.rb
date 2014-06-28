require 'spec_helper'

feature 'Records UI' do
  scenario 'is reset between refreshes', js: true do
    visit root_path

    click_button 'search'

    expect(page).to have_content('Search for something!')
  end
end
