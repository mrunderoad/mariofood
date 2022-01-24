require 'rails_helper'

describe "the difference from user and admin account" do
  it "should add products if admin" do
    admin = User.create!(:email => 'i@i.com', :password => 'faker11', :admin => true)
    login_as(admin, :scope => :user)
    visit products_path
    expect(page).to have_content "Add product"
  end
end