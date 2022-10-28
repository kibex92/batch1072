require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# FIND(ONE)

task = Task.find(1)
puts "#{task.title} - #{task.description}"

# CREATE

task = Task.new(title: "Vodka'o Clock", description: "Die")
task.save
puts task.id

# UPDATE

task = Task.find(2)
task.done = true
puts "#{task.done ? "[X]" : "[ ]"} #{task.title}"

# READ(ALL)

tasks = Task.all # => Array
tasks.each do |task|
  puts "#{task.done ? "[X]" : "[ ]"} #{task.title}" 
end

# DESTROY
task = Task.find(1)
task.destroy
Task.find(1) == nil 