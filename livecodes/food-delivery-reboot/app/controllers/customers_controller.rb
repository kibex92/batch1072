require_relative '../views/customers_view'
require_relative '../models/meal'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo # => Instance of MealRepository
    @view = CustomersView.new
  end

  def list
    # 1. Get the customers from repo
    customers = @customer_repo.all
    # 2. send customers to the view
    @view.display(customers)
  end

  def add
    # Get name and price from user
    name = @view.ask_user_for("name")
    address = @view.ask_user_for("address")
    # Create new meal instance
    customer = Customer.new(name: name, address: address)
    # Pass customer instance to repo in order to save it
    @customer_repo.create(customer)
  end
end