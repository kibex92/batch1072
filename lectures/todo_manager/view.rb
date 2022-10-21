class View # Handles the User Input/Output
  def ask_user_for_task_description
    puts "What have you still not done?"
    gets.chomp
  end

  def display(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{done} #{task.description}"
    end
  end

  def ask_user_for_index
    puts "What is the number of the task?"
    gets.chomp.to_i - 1
  end
end
