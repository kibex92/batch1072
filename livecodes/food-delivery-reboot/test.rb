require_relative 'app/repositories/meal_repository'
require_relative 'app/models/meal'

meal_repo = MealRepository.new("data/meals.csv")
meal = Meal.new(name: "Snails", price: 500)
meal_repo.create(meal)

p meal_repo.all