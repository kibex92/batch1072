require "json"

# PARSING JSON

# TODO - let's read/write data from beatles.json
# filepath = "data/beatles.json"

# serialized_beatles = File.open(filepath).read
# beatles_hash = JSON.parse(serialized_beatles)
# beatles_hash["beatles"][2]["first_name"]
# Hash    # Array      # Hash

# STORING JSON
beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  },
]}

filepath = "data/new_beatles.json"
File.open(filepath, "wb") do |file|
  file.write(JSON.pretty_generate(beatles))
end
