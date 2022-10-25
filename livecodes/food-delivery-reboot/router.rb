class Router
  def initialize(meals_controller)
    @running = true
    @meals_controller = meals_controller
  end

  def run
    # Display the menu
    while @running
      display_menu
      # get user input
      action = gets.chomp.to_i
      # dispatch
      dispatch(action)
    end
  end
  
  private

  def display_menu
    puts "*****************"
    puts "******MENU*******"
    puts "*****************"
    puts "1 - List all meals"
    puts "2 - Create a meal"
    puts "9 - Quit"
  end
  
  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 9 then stop
    else 
      puts "Wrong input"
    end
  end

  def stop
    @running = false
  end
end