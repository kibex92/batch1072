require 'csv'
require_relative 'patient'
class PatientRepository
  def initialize(csv_file_path, room_repo)
    @csv_file_path = csv_file_path
    @room_repo = room_repo # => Instance of room repository
    @patients = []
    @next_id = 1
    load_csv
  end

  # CRUD

  def add_patient(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
  end
  
  def all
    @patients
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # row => Is now a Hash, with headers as keys
      # row = {name: "Murad", age: "25", cured: "false", room_id: "1"}
      row[:age] = row[:age].to_i
      row[:id] = row[:id].to_i
      room_id = row[:room_id].to_i
      # Find the room by id in the room repo
      room = @room_repo.find_by_id(room_id)
      row[:cured] = row[:cured] == "true"
      patient = Patient.new(row)
      patient.room = room
      @patients << patient
    end
    # Updates the next id in case we have elements in the CSV
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
  
end