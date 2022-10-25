class Customer
  attr_reader :name, :address
  attr_accessor :id
  
  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end
end