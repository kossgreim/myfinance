require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) {build(:account)}
  describe 'valdiation' do
    context 'valid when' do
      it 'has valid factory' do 
        expect(account).to be_valid
      end
    end
    context 'invalid when' do
      it 'has no user' do
        account.user = nil
        expect(account).to be_invalid
      end
      it 'has no name' do
        account.name = nil
        expect(account).to be_invalid
      end
    end
  end
end
