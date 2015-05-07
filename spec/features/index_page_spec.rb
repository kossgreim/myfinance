require 'rails_helper'
describe "frontend index page", :type => :feature do

  it "Valid sign in link" do
    visit homepage_path
    click_link 'Sign in'
    expect(page).to have_content('Sign in')

  end
end

