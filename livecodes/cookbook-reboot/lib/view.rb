class View
  def ask_user_for(something)
    puts "What is the #{something}"
    gets.chomp
  end

  def display_list(recipes)
    # recipes is the array of recipe instances
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_index
    puts "What is the number of the recipe?"
    gets.chomp.to_i - 1
  end
end