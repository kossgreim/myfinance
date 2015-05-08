require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
	describe "#index" do
		context "when user not signed in" do
			
			it "redirects to sign in form" do 
				get 'index'
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end