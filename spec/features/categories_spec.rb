require "rails_helper"

describe "Category features", type: :feature do
  
  before(:each) do 
    login(create( :user ))
  end
  
  it 'create' do 
    visit new_category_path
    category_name = Faker::Commerce.product_name
    fill_in 'Name', with: category_name
    click_button 'Create Category'
    expect(page).to have_content(category_name)
  end

  it 'update' do 
    category = create(:category)
    visit categories_path
    find("a[href='#{edit_category_path(category)}']").click
    expect(current_path).to eq(edit_category_path(category))
    category_name = Faker::Commerce.product_name
    fill_in 'Name', with: category_name
    click_button 'Update'
    expect(page).to have_content(category_name)
  end

  it 'delete' do 
    3.times do 
      create(:category)
    end
    visit categories_path
    expect{ first(:link, 'Delete').click }.to change(Category, :count).by(-1)
  end

  it 'displays account\'s user\'s full name' do 
    category = create(:category)
    visit category_path(category)
    expect(page).to have_content(category.user.full_name)
  end
end