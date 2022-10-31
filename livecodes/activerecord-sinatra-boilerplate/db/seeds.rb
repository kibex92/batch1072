require 'faker'

10.times do 
  restaurant = Restaurant.new(
    name: Faker::FunnyName.name,
    address: Faker::TvShows::GameOfThrones.city,
    rating: rand(1..5)
  )
  restaurant.save
end