require_relative 'patient'
require_relative 'room'

donny = Patient.new(name: "Donald Trump", age: 89)
murad = Patient.new(name: "Murad Hasanov", age: 25)
boris = Patient.new

lotus = Room.new(name: "Lotus", capacity: 2)
puts "#{lotus.name} has #{lotus.patients.size} patients. Full? #{lotus.full?}"

lotus.add_patient(donny)
lotus.add_patient(murad)
puts "#{lotus.name} has #{lotus.patients.size} patients. Full? #{lotus.full?}"

# begin
#   lotus.add_patient(boris)
# rescue Exception
#   puts "No more beds in the room. Try another"
# end

# puts "#{lotus.name} has #{lotus.patients.size} patients. Full? #{lotus.full?}"
p donny.room.patients.first.room.patients[1].name