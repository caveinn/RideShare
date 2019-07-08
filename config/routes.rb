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
  get "/rides/:id/offer" => "rides#offer_to_request"

  get "/offer_ride" => "rides#offer_form", as: "show_offer_form"
  post "/offer_ride" => "rides#create_offer", as: "create_offer"

  get "create_request" => "rides#request_form"
  post "create_request" => "rides#create_request"

  get "/requests/:id/accept" => "requests#accept"
  get "/requests/:id/decline" => "requests#decline"
  get "/requests" => "requests#index"
  
  root "home#index"

end
