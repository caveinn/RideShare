Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :rides
  end
 
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/rides" => "rides#rides_index"
  get "/rides/:id/request" => "rides#request_ride"
  
  get "/requests/:id/accept" => "requests#accept"
  get "/requests/:id/decline" => "requests#decline"
  get "/requests" => "requests#index"
  
  root "home#index"

end
