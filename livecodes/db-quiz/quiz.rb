# What’s the SQL query to get the 3 most recent books written by Jules Verne?
SELECT * FROM authors
JOIN books ON authors.id = books.author_id
WHERE authors.name = "Jules Verne"
ORDER BY year DESC
LIMIT 3

class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps # created_at + updated_at
    end
  end
end

class CreateBooks < ActiveRecord::Migration[7.0]
 def change
    create_table :books do |t|
    t.string :title
    t.integer :year
    t.references :author, foreign_key: true
    t.timestamps
  end
 end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end
  end
end

class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :date
      t.timestamps
    end
  end
end

class AddCategoryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :category, :string
  end
end

# Define each Active Record model with its associations for your database.
# Hint: We’re working with 4 tables: authors, books, users & readings. Therefore we need 4 models!

class Author < ActiveRecord::Base
  #TODO
  has_many :books
end

class Book < ActiveRecord::Base
  #TODO
  has_many :readings
  has_many :users, through: :readings
  belongs_to :author
end

class User < ActiveRecord::Base
  #TODO
  has_many :readings
  has_many :books, through: :readings
end

class Reading < ActiveRecord::Base
  #TODO
  belongs_to :user
  belongs_to :book
end

#1. Add your favorite author to the DB
aristotle = Author.new(name: "Aristotle")
aristotle.save!

#2. Get all authors
Author.all

#3. Get author with id=8
Author.find(8)

#4. Get author with name="Jules Verne", store it in a variable: jules
jules = Author.find_by_name("Jules Verne")
jules.save

#5. Get Jules Verne's books
jules.books

#6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
twenty_thousand = Book.new(title: "20000 Leagues under the Seas", year: 1876)

#7. Add Jules Verne as this book's author
twenty_thousand.author = jules

#8. Now save this book in the DB!
twenty_thousand.save

class Author
  validates :name, presence: true
end




