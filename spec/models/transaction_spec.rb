require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }
  
  describe 'validation' do
  	context 'invalid when' do 
  		it 'has no amount' do 
  			transaction.amount = nil
  			expect(transaction).to be_invalid
  		end
  		it 'has no category' do
  			transaction.category = nil
  			expect(transaction).to be_invalid
  		end
  	end
  	context 'valid when' do
  		it 'has valid factories' do 
  			expect(transaction).to be_valid
  		end
  	end
  end
  
  describe 'interaction with data' do 
    let(:account) { create(:account) }
    
    context 'when updates a transaction\'s amount' do
      it 'changes account\'s balance' do 
        transaction.account = account
        transaction.save!
        new_amount = BigDecimal(Faker::Commerce.price)
        differ = transaction.amount - new_amount
        transaction.amount = differ
        expect{ transaction.save }.to change(account, :balance).by(differ)
      end
    end
    
    context 'when creates a new transaction' do 
      it 'updates account\'s balance' do
        transaction.account = account
        expect{ transaction.save }.to change(account, :balance).by(transaction.amount)
      end
    end
  end
end
