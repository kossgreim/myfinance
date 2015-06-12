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
      it 'has no name' do
        account.name = nil
        expect(account).to be_invalid
      end
      it 'has no user' do
        account.user = nil
        expect(account).to be_invalid
      end
    end
  end
  describe '.perform_transaction' do
    before(:each) do 
      @category = create(:category)
      @subcategory = create(:subcategory)
    end
    it 'update account\'s balance' do
      expect{ account.perform_transaction(25, @category, false, @subcategory, 'test comment') }.to change(account, :balance).by(BigDecimal(-25))
    end

    it 'creates transaction log' do
      expect( account.perform_transaction(123, @category, true, @subcategory, 'test comment') ).to change(Transaction, :count).by(1)
    end
  end
end
