class Customer < ApplicationRecord
	has_many :tours
	validates :document, presence: true,
		length: { minimum: 7 }

  def find_tours_by_customer
    Customer.joins("RIGHT JOIN customers_tours ON customers.id = customers_tours.customers_id")
  end
  def format_name
    #self[:name].upcase
R   @name = Customer.select(:name)
    @name.upcase
  end
end
