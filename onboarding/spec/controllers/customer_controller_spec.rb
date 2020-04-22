require 'rails_helper'
describe CustomerController , type: :controller do
  let(:customer) { create(:customer) }

  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response.body).to eq('')
    end
  end

  describe '#show' do
    it 'renders the show tamplate' do
      get :show, params: {id: customer.id}
      expect(response.body).to eq('')
    end
  end

  describe '#find_all' do
    it 'returns json format' do
      post :find_all, format: :json
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
    it 'returns html format' do
      post :find_all
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end
  end
end
