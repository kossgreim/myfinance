require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validation' do 
    let(:category) { build(:category) }
    context 'when valid' do 
      
      it 'has valid factory' do 
        expect(category).to be_valid
      end
    
    end
    context 'when invalid' do 
      
      it 'has no name' do
        category.user = nil
        expect(category).to be_invalid
      end
      it 'has no user' do
        category.user = nil
        expect(category).to be_invalid
      end

    end
  end
end
