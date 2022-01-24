require 'rails_helper'

describe "the Delete a Product process" do

  before(:each) do
    admin = User.create!(:email => 'i@i.com', :password => 'faker11', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "deletes a product" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    visit product_path(product)
    click_on 'Delete'
    expect(page).to have_no_content "Apple"
    expect(page).to have_content "Product deleted!"
  end
end