random_number = rand(0..10)
#random number
number_of_guess = 0
#number of guess
puts "Please insert your name..."
name = gets.chomp
puts "Welcome, #{name}"
puts "Please guess between 0 and 100"
correct = false
while !correct
  ans = gets.chomp
  ans = ans.to_i
  if ans == random_number
    correct = true
    break
  end
  number_of_guess += 1
  puts "wrong answer", "Number of guess:#{number_of_guess}"
end

puts "What a Champion, you win 10.000$" if ans == random_number