require "rails_helper"

describe "Acount features", type: :feature do
  
  before(:each) do 
    login(create( :user ))
  end
  
  it 'creates accounts' do 
    visit new_account_path
    account_name = Faker::Commerce.department
    fill_in 'Name', with: account_name
    click_button 'Create'
    expect(page).to have_content(account_name)
  end

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
end