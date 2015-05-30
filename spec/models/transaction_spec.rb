require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validation' do
  	let(:transaction) {build(:transaction)}
  	context 'invalid when' do 
  		it 'has amount 0.00' do 
  			transaction.amount = 0.00
  			expect(transaction).to be_invalid
  		end
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
  describe '.perform_transaction' do
    it 'changes balance according to transaction' do
      transaction = build(:transaction)
      if transaction.type?
        expect{transaction.perform_transaction}.to change(transaction.account, :balance).by(+transaction.amount)
      else
        expect(transaction.perform_transaction).to change(transaction.account, :balance).by(-transaction.amount)
      end
    end
  end
end
