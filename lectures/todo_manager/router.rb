class Router
  def initialize(controller)
    @controller = controller # => controller is an instance of Controller class
  end
  
  def run
    puts "Welcome to your TODO Manager!"
    loop do
      puts "What would you like to do?"
      puts "1 - Create a task"
      puts "2 - List all tasks"
      puts "3 - Mark a task as done"
      action = gets.chomp.to_i
  
      case action
      when 1 then @controller.create 
      when 2 then @controller.list
      when 3 then @controller.mark_as_done
      else
        puts "Please input numbers from 1-3"  
      end
    end
  end
end