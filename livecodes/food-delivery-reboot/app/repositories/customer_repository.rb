require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end
  
  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end
  

  def find(id)
    @customers.find { |customer| customer.id == id }
  end
  
  private

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w(id name address)
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
  

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end
end