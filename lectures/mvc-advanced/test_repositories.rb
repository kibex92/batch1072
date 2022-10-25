require_relative 'patient_repository'
require_relative 'room_repository'
require_relative 'patient'

room_repo = RoomRepository.new("rooms.csv")
patient_repo = PatientRepository.new("patients.csv", room_repo)
# p patient_repo

patients = patient_repo.all # => Array of patient instances

# patients.each do |patient|
#   puts "#{patient.id}. #{patient.name} is in room #{patient.room.name}"
# end

pierre = Patient.new(name: "Pierre", age: 31)
emma = Patient.new(name: "Emma", age: 18)
lotus = Room.new(name: "Lotus", capacity: 2)
patient_repo.add_patient(pierre)
patient_repo.add_patient(emma)
p patient_repo
