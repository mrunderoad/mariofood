require 'rails_helper'

describe "the add a product process" do

  before(:each) do
    admin = User.create!(:email => 'i@i.com', :password => 'fakers1', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "adds a product" do
    visit products_path
    click_link 'Add product'
    fill_in 'Name', :with => 'Apple'
    fill_in 'Cost', :with => '4'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Submit!'
    expect(page).to have_content 'Product added!'
    expect(page).to have_content 'Apple'
  end

  it "gives error when a normal user tries to get to admin page" do
    notadmin = User.create!(:email => 'i@i.com', :password => 'faker11')
    login_as(notadmin, :scope => :user)
    visit new_product_path
    expect(page).to have_content 'Not able to add product! Please try again.'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Add Product!'
    expect(page).to have_content "Name can't be blank"
  end
end