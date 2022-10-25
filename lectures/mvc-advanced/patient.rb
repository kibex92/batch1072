class Patient
  attr_reader :name, :age
  attr_accessor :room, :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @age = attributes[:age]
    @cured = attributes[:cured] || false
    @room = attributes[:room]
    @id = attributes[:id]
    # STATE
    # - name
    # - date_of_birth
    # - condition
    # - cured
    # - insurance
    # - treatment
  end

  # BEHAVIOUR
  def cured?
    @cured
  end
  
  def cure!
    @cured = true
  end
  
end