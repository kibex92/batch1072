class Repository
  def initialize
    @tasks = []
  end

  # BEHAVIOUR

  # CRUD:
  # Add a task
  def add_task(task)
    @tasks << task
  end
  # Delete a task
  # Update a task/Mark as done
  # Read the tasks
  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end
end