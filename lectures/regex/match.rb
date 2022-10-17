# puts "What is your mail?"
# email = gets.chomp

# pattern = /[a-zA-Z]+@[a-zA-Z]+\.(\w{2,4})+(\.\w{2})?/

# if email.match?(pattern)
#   puts "Yay, valid email! 🎉"
# else
#   puts "Nooo, invalid! 💩"
# end

puts "What is your name?"
name = gets.chomp

pattern = /^(?<first_name>\w+) (?<last_name>\w+)$/

if name.match?(pattern)
  match_data = name.match(pattern)
  puts "Hey! I've extracted your first name, it's #{match_data[:first_name]}"
end