Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #post '/customer/create' => 'customer#create', as: :create_customer
  #get '/customer/find_all' => 'customer#find_all', as: :find_all
  resources :customer do
    collection do
      post 'find_all'
    end
  end
  #resources :find_all, controller: 'customers'
end
