Rails.application.routes.draw do
  get "/" => "home#index"
  resources :users
  resources :orders
  resources :menus
  resources :order_items
  resources :menu_items
  post "users/login", to: "users#login"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
