# This is where you can create initial data for your app.
require 'faker'

100.times do
  restaurant = Restaurant.new(
    name: Faker::Fantasy::Tolkien.character,
    address: Faker::Fantasy::Tolkien.location,
    rating: rand(1..5)
  )
  restaurant.save
end
puts "Done"