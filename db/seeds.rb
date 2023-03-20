require 'faker'
puts "🌱 Seeding ."

20.times do
    Pizza.create!(
      name: Faker::Food.dish,
      ingredients: Faker::Food.ingredient
    )
end
 # Create 10 restaurants
10.times do
    Restaurant.create!(
      name: Faker::Restaurant.name,
      address: Faker::Address.full_address
    )
end
  # Create 30 RestaurantPizzas
30.times do
    RestaurantPizza.create!(
      price: rand(1..30),
      restaurant: Restaurant.all.sample,
      pizza: Pizza.all.sample
    )
end
  
puts "✅ Done seeding!"
