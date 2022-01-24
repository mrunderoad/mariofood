require 'rails_helper'

describe "the Edit a Review process" do

  before(:each) do
    admin = User.create!(:email => 'Capy@Bara.com', :password => 'epicodus', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "edits a review" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    review = Review.create(author: "Luigi", content_body: "Now we can create integration testing files. Let's create a few examples to test CRUD functionality for adding albums", rating: '5', product_id: product.id)
    visit product_review_path(product, review)
    click_link "Edit review"
    fill_in 'Author', :with => "Princess Peach"
    click_on 'Submit!'
    expect(page).to have_content "Princess Peach"
    expect(page).to have_no_content "Luigi"
  end

  it "gives an error when one of the update fields is blank" do
    product = Product.create(name: "Mushroom Stew", cost: "69", country_of_origin: "USA")
    review = Review.create(author: "Bill", content_body: "Lets try to write a review about an apple! its good tasting and good for you son!", rating: '4', product_id: product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Content body', :with => ''
    click_on 'Add Review'
    expect(page).to have_content 'Not able to add review! Please try again.'
  end

end