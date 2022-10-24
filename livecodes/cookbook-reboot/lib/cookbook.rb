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
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      #{name: "something", description: "something"}
      @recipes << Recipe.new(row)
    end
  end

  def write_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w(name description rating)
      @recipes.each do |recipe|
        # recipe.name => Burek
        # recipe.description => Tasty
        csv << [recipe.name, recipe.description, recipe.rating]
      end
    end
  end
end