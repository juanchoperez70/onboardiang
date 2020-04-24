class Customer < ApplicationRecord
  has_and_belongs_to_many :tours
  validates :document, presence: true,
		length: { minimum: 7 }

  def self.find_tours_by_customer
    joins("RIGHT JOIN customers_tours ON customers.id = customers_tours.customers_id")
  end

  def format_name
    name.upcase
   #@name = Customer.select(:name)
   #@name.upcase
  end

  def parse_from_json
    query = if id.even?
      Aws::DynamoDB.query(id).to_json
    end
    puts query
    query
  end
end
