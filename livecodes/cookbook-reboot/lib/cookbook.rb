require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  # CRUD ACTIONS

  # ADD
  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end
  # DELETE
  def remove_recipe(index)
    @recipes.delete_at(index)
    write_csv
  end
  # RETURN ALL RECIPES
  def all
    @recipes
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
    end
  end

  def write_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        # recipe.name => Burek
        # recipe.description => Tasty
        csv << [recipe.name, recipe.description]
      end
    end
  end
end