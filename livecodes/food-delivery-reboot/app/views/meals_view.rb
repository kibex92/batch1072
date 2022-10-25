class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} #{meal.price}€"
    end
  end

  def ask_user_for(stuff)
    puts "What's the #{stuff}"
    gets.chomp
  end
end