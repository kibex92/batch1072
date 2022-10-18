require "csv"

# TODO - let's read/write data from beatles.csv
# filepath = "data/beatles.csv"

# # PARSING CSV
# CSV.foreach(filepath, headers: :first_row, header_converters: :symbol) do |row|
#   first_name = row[:first_name]
#   last_name = row[:last_name]
#   instrument = row[:instrument]
#   puts "#{first_name} #{last_name} played #{instrument} in the beatles"
# end

# STORING CSV

filepath = "data/musicians.csv"

musicians = [
  {first_name: "Mick", last_name: "Jagger", instrument: "Voice"},
  {first_name: "Taylor", last_name: "Swift", instrument: "Voice"},
  {first_name: "Tate", last_name: "McRae", instrument: "Voice"},
  {first_name: "Pierre", last_name: "Boulez", instrument: "Conductor"},
  {first_name: "John", last_name: "Lennon", instrument: "Guitar"},
]

CSV.open(filepath,"wb" ) do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  musicians.each do |musician|
    csv << [musician[:first_name], musician[:last_name], musician[:instrument]]
  end
end
