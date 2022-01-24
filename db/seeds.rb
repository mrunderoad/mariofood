require 'faker'

Product.destroy_all
Review.destroy_all
User.destroy_all

1.times do |index|
  user = User.create!({email:'admin@epicodus.com', password: 'abcd1234', admin:true})
end

1.times do |index| 
  user = User.create!({email: 'user@epicodus.com', password: 'abcd1234', admin: false})
end

50.times do |index| 
  product = Product.create!(name: Faker::FunnyName.name, cost: Faker::Number.within(range:1..10000), country_of_origin: Faker::Team.state)
  5.times do |index|
    Review.create!(author: Faker::Superhero.name, content_body: Faker::Marketing.buzzwords, rating: Faker::Number.within(range 1..5), product_id: product.id)
  end
end

p "Created #{Product.count} products!"
p "Created #{Review.count} reviews!"
p "Created #{User.count} users!"

