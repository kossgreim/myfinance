require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do 
  	let(:user) {build(:user)}
  	describe 'valdiation' do
  		context 'valid when' do
  			it 'it has valid factories' do 
  				expect(user).to be_valid 
  			end
  		end

  		context 'invalid when' do
  			it 'password < 8 sym.' do 
  				user.password = Faker::Internet.password(6)
  				expect(user).to be_invalid
  			end

  			it 'no email' do
  				user.email = nil
  				expect(user).to be_invalid
  			end

  			it 'email without @' do
  				user.email = 'test'
  				expect(user).to be_invalid
  			end

  			it 'no name' do
  				user.name = nil
  				expect(user).to be_invalid
  			end

  			it 'no last name' do
  				user.last_name = nil
  				expect(user).to be_invalid
  			end
  		end
  	end

  	describe '.full_name' do
  		it 'it combines name and last name' do
  			expect(user.full_name).to eq(user.name+' '+user.last_name)
  		end
  	end
  	
  end
end