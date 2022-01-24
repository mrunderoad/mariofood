require 'rails_helper'

describe "delete a review route" do

  before(:each) do
    admin = User.create!(:email => 'i@i.com', :password => 'faker11', :admin => true)
    login_as(admin, :scope => :user)
  end

  it "deletes a review" do
    product = Product.create(name: "Apple", cost: "4", country_of_origin: "USA")
    review = Review.create(author: "Bill", content_body: "Lets try to write a review about an apple! its good tasting and good for you son!", rating: '4', product_id: product.id)
    visit product_review_path(product, review)
    click_on 'Delete'
    expect(page).to have_no_content "Bill"
    expect(page).to have_content "Review deleted!"
  end
end