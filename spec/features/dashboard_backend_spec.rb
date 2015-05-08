require 'rails_helper'
describe "Dashboard page", :type => :feature do

  context "when signed in" do
    it "has Log out link" do
      user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_link('Log out')
    end
  end
end

