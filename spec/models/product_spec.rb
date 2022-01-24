require 'rails-helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validaye_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it("titleizes the product name") do
    product - Product.new({name: "apple", cost: 4, country_of_origin: "USA"})
    expect(product.name).to eq("Apple")
  end
end