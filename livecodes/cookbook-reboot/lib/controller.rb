require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def list
    # 1. Get all recipes from cookbook
    # 2. Display all recipes
    display_recipes
  end
  
  def destroy
    # 1. list recipes
    display_recipes
    # 2. Ask user for index and save it
    index = @view.ask_user_for_index
    # 3. Pass index to #remove_recipe in cookbook
    @cookbook.remove_recipe(index)
    display_recipes
  end
  
  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end 