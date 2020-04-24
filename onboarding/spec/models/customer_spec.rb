require 'rails_helper'
describe Customer do
  let(:customer) { Customer.new}

  describe '#format_name' do
    it 'change name to uper case' do
      customer.name = 'andrea'
      expect(customer.format_name).to eql 'ANDREA'
   end
  end

  describe '#find_tours_by_customer' do
    it 'returns all tours for a customer' do
      pending
      expect(Customer.find_tours_by_customer).not_to be_empty
    end
  end

  module Aws
    module DynamoDB
      def query(id)
      end
      module_function :query
    end
  end

  describe '#parse_from_json' do
    let(:expected_results) { {saludo:'hola mundo'}}

    it 'converts the dynamoDB response to json' do
       customer.id=0
       allow(Aws::DynamoDB).to receive(:query).with(customer.id).and_return(expected_results)
       expect(customer.parse_from_json).to eq(expected_results.to_json)
    end

    it 'only makes dynamoDB queries when customer id is even' do
      customer.id = 2
      allow(Aws::DynamoDB).to receive(:query).with(customer.id).and_return(expected_results)
      customer.parse_from_json
      expect(Aws::DynamoDB).to have_received(:query).with(customer.id)
    end

    it 'does not make dynamoDB queries when customer id is odd' do
      customer.id = 3
      allow(Aws::DynamoDB).to receive(:query).with(customer.id)
      customer.parse_from_json
      expect(Aws::DynamoDB).not_to have_received(:query).with(customer.id)
    end
  end
end
