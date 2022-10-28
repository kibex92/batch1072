class Task
  attr_reader :title, :description, :id
  attr_accessor :done
  def initialize(attribute = {})
    @id = attribute[:id]
    @title = attribute[:title]
    @description = attribute[:description]
    @done = attribute[:done] || false 
  end

  def self.find(id)
    row = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    Task.new(id: row["id"], title: row["title"], description: row["description"], done: row["done"])
  end

  def save
    if @id.nil?
      query = DB.execute('INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)', @title, @description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
    else
      query = DB.execute('UPDATE AT tasks set title = ?, description = ?, done = ? WHERE id = ?', @title, @description, @done ? 1 : 0, @id)
    end
  end
end