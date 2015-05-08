require 'rails_helper'
describe "frontend index page", :type => :feature do

  it "sign in link" do
    visit homepage_path
    expect(page).to have_link "Sign in"
  end
end

