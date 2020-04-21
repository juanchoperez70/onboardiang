require 'rails_helper'
describe Customer do
  let(:customer) { Customer.new }
  before do
    customer.name = 'JOHN'
  end
  describe '#format_name' do
    it 'change name to uper case' do
      #customer = Customer.new
      #customer.name = "andrea"
      #customer = double(:name => "andrea")

      allow(customer).to receive(:format_name) { 'JOHN' }

      #expect(customer.format_name).to eql 'JOHN'
   end
  end
  describe '#find_tours_by_customer' do
    it 'pending' do
      #expect(Customer.find_tours_by_customer).not_to be_empty
    end
  end
end
