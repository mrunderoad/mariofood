require 'rails_helper'

describe "edit a product route" do

  before(:each) do
    admin = User.create!(:email => 'i@i.com', :password => 'faker11', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "edits product" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    visit product_path(product)
    click_on 'Edit'
    fill_in 'Name', :with => "Banana"
    click_on 'Add Product'
    expect(page).to have_content "Banana"
  end

  it "gives error if one of the fields is blank" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    visit edit_product_path(product)
    fill_in 'Cost', :with => ''
    click_on 'Add Product'
    expect(page).to have_content "Not able to add product! Please try again."
    expect(page).to have_content "Cost can't be blank"
  end

end