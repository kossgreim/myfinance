require "rails_helper"

describe "Transactions features", type: :feature do
  let(:user) { create(:user_with_all_associations) }
  before(:each) do 
    login(user)
  end
  
  it 'creates a new transaction' do 
    visit transactions_path
    click_link 'New'
    expect(current_path).to eq(new_transaction_path)
    transaction = build(:transaction)
    fill_in 'Comment', with: transaction.comment
    fill_in 'Amount', with: transaction.amount
    select user.categories.first.name, from: 'Category'
    select user.categories.first.subcategories.first.name, from: 'Subcategory'
    select user.accounts.first.name, from: 'Account'
    expect{ click_button('Create') }.to change(Transaction, :count).by(1)
  end

=begin
it 'updates accounts' do 
    account = create(:account)
    visit accounts_path
    find("a[href='#{edit_account_path(account)}']").click
    expect(current_path).to eq(edit_account_path(account))
    account_name = Faker::Commerce.department
    fill_in 'Name', with: account_name
    click_button 'Update'
    expect(page).to have_content(account_name)
  end

  it 'deletes accounts' do 
    3.times do 
      create(:account)
    end
    visit accounts_path
    expect{ first(:link, 'Delete').click }.to change(Account, :count).by(-1)
  end

  it 'displays account\'s user\'s full name' do 
    account = create(:account)
    visit account_path(account)
    expect(page).to have_content(account.user.full_name)
  end
=end

end