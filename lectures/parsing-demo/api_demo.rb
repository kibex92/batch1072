require "json"
require "open-uri"

puts "Which user do you want to look for?"
nickname = gets.chomp
url = "https://api.github.com/users/#{nickname}"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)


puts "#{user["name"]} - #{user["bio"]}"