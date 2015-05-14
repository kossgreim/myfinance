require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "#index" do
    context 'when user is logged in' do 
      before do
        login_user
        get :index
      end
      it 'assigns list of accounts' do 
        account = create(:account)
        expect(assigns(:accounts)).to eq([account])
      end

      it 'renders listing page' do
        expect(response).to render_template('index')
      end
    end

    context 'when user is logged out' do
      before { get :index }
      it { is_expected.to redirect_to new_user_session_path }
    end
  end
end