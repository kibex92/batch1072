require_relative 'view'
require_relative 'recipe'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    rating = @view.ask_user_for("rating")
    prep_time = @view.ask_user_for("Preparation Time")
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
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
  
  def import
    # get user input on search term
    ingredient = @view.ask_user_for("ingredient")
    # store base search url
    url = "https://www.allrecipes.com/search?q=#{ingredient}"

    # Download the page
    html = URI.open(url).read
    # Create nokogiri object
    doc = Nokogiri::HTML(html)
    recipes = []
    doc.search(".mntl-card-list-items").each do |element|
      unless element.search(".mntl-recipe-star-rating").empty?
        recipe_url = element.attribute("href").value
        recipe_html = URI.open(recipe_url).read
        recipe_doc = Nokogiri::HTML(recipe_html)  # => Is the nokogiri object of the recipe page

       name = recipe_doc.search("h1").text.strip
       description = recipe_doc.search(".article-subheading").text.strip
       rating = recipe_doc.search(".mntl-recipe-review-bar__rating").text.strip
       if recipe_doc.search(".mntl-recipe-details__label:contains('Total Time')").empty?
        prep_time = "No time given"
      else
        prep_time = recipe_doc.search(".mntl-recipe-details__label:contains('Total Time') ~ .mntl-recipe-details__value").text.strip
       end
       recipes << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
      end
    end
    @view.display_list(recipes.first(5))
    # ask user for which recipe he/she wants to save
    index = @view.ask_user_for_index
    # Find recipe by index
    recipe = recipes[index]
    # Cookbook, new recipe incoming
    @cookbook.add_recipe(recipe)
  end
  

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end 