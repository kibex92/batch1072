require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  # CRUD

  def add_rooms(room)
    @rooms << room
  end
  
  def all
    @rooms
  end

  def find_by_id(id)
    @rooms.find { |room| room.id == id }
  end
  

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:capacity] = row[:capacity].to_i
      row[:id] = row[:id].to_i
      room = Room.new(row)
      @rooms << room
    end
  end
end