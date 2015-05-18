require "rails_helper"

describe "Subcategory features", type: :feature do

  before(:each) { login(create( :user )) }
  let(:category) { category = create(:category) }

  it 'creates new subcategory for a category' do
    visit category_path(category)
    click_link 'New'
    expect(current_path).to eq(new_category_subcategory_path(category))
    fill_in 'Name', with: Faker::Commerce.product_name
    #click_button 'Create'
    expect{ click_button 'Create' }.to change(Subcategory, :count).by(+1)
    expect(page).to have_content('created')
  end

  it 'edites a subcategory' do 
    subcategory = create(:subcategory, category: category)
    visit category_path(category)
    find("a[href='#{edit_category_subcategory_path(category, subcategory)}']").click
    expect(current_path).to eq(edit_category_subcategory_path(category,subcategory))
    name = Faker::Commerce.product_name
    fill_in 'Name', with: name
    click_button 'Update'
    expect(page).to have_content(name)
  end

  it 'deletes a subcategory' do 
    subcategory = create(:subcategory, category: category)
    visit category_path(category)
    expect{
      find("a[href='#{category_subcategory_path(category, subcategory)}']").click
    }.to change(Subcategory, :count).by(-1)
  end
end
