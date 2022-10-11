def greeting(name)
  # name = name.to_s
  # "Hello " + name
  "Hello, #{name}"
end


def other_greeting
  return "Hello everyone!"
end

pierre = "Pierre"
emma = "Emma"
abbas = "Abbas"

puts greeting(pierre) # The same as the one down
# puts greeting("Pierre")

puts greeting(emma)
puts greeting(abbas)

puts other_greeting