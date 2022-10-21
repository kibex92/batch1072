require_relative 'task'

class Controller
  def initialize(view, repository)
    @view = view # => @view is an instancen of View
    @repository = repository # => @repository is an instance of Repository
  end

  # USER ACTIONS
  def create
    # Get input from user
    description = @view.ask_user_for_task_description
    # Create task instance
    task = Task.new(description)
    # Send it to repository, so it can be saved
    @repository.add_task(task)
  end

  def list
    # Get all tasks from repository
    tasks = @repository.all
    # Send tasks to the view to be displayed
    @view.display(tasks)
  end

  def mark_as_done
    # List all the tasks
    list
    # Ask user for index of task he/she wants to mark as done
    index = @view.ask_user_for_index
    # Find the task from the repo
    task = @repository.find(index)
    # Mark task as done
    task.mark_as_done!
    # List all tasks again
    list
  end

  def delete
  
  end
end