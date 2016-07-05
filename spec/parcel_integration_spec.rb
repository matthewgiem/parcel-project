require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the parcel path', {:type => :feature}) do
  it('processes the user entry and returns the shipping price of the package') do
    visit('/')
    choose('centimeters')
    fill_in('length', :with => 4.3)
    fill_in('width', :with => 10.6)
    fill_in('height', :with => 11.93)
    fill_in('weight', :with => 4.53)
    choose('international')
    choose('standard')
    click_button('Submit')
    expect(page).to have_content("67.95")
  end
end
