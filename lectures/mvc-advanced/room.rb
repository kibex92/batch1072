class Room
  attr_reader :capacity, :name, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    # - ward(department)
    @name = attributes[:name]
    @patients = attributes[:patients] || [] 
    @id = attributes[:id]
  end

  # BEHAVIOUR
  # full?
  # add_patient

  def full?
    @patients.size >= @capacity
  end
  
  def add_patient(patient)
    raise Exception, "The room is full" if full?
    @patients << patient
    patient.room = self
  end

  def remove_patient(patient)
    @patients.delete(patient)
  end
end