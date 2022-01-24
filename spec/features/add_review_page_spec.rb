require 'rails_helper'

describe "the Add a Review process" do

  before(:each) do
    admin = User.create!(:email => 'i@i.com', :password => 'faker11', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "adds a review" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    visit product_path(product)
    click_link "Add review"
    fill_in 'Author', :with => 'Bill'
    fill_in 'Content body', :with => "Lets try to write a review about an apple! its good tasting and good for you son!"
    fill_in 'Rating', :with => '4'
    click_on 'Add Review!'
    expect(page).to have_content 'Review added!'
    expect(page).to have_content "Bill's review"
  end

  it "gives an error when no author is entered" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    visit new_product_review_path(product)
    click_on 'Add Review!'
    expect(page).to have_content "Not able to add review! Please try again."
    expect(page).to have_content "Author can't be blank"
  end
end