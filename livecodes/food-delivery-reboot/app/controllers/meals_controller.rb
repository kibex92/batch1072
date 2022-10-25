require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo # => Instance of MealRepository
    @view = MealsView.new
  end

  def list
    # 1. Get the meals from repo
    meals = @meal_repo.all
    # 2. sened meals to the view
    @view.display(meals)
  end

  def add
    # Get name and price from user
    name = @view.ask_user_for("name")
    price = @view.ask_user_for("price").to_i
    # Create new meal instance
    meal = Meal.new(name: name, price: price)
    # Pass meal instance to repo in order to save it
    @meal_repo.create(meal)
  end
end