require 'spec_helper'

feature 'Application' do

  # Ensure application server is up
  scenario 'is running' do
    visit '/'
    expect(page.status_code).to be(200)
  end

end
