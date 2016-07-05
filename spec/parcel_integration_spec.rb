require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the parcel path', {:type => :feature}) do
  it('processes the user entry and returns the shipping price of the package') do
    visit('/')
    choose('inches')
    fill_in('length', :with => 2)
    fill_in('width', :with => 3)
    fill_in('height', :with => 4)
    fill_in('weight', :with => 2)
    choose('international')
    choose('express')
    click_button('Submit')
    expect(page).to have_content("45.00")
  end
end
