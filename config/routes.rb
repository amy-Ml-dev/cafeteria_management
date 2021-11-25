Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :menus
  resources :order_items
  resources :menu_items

  patch "menus/edit_menu_details" => "menus#edit_menu_details", as: :edit_menu_details
  patch "menu_item/edit_menu_items_details" => "menu_items#edit_menu_item_details", as: :edit_menu_item_details
  get "/active" => "menus#active_menus", as: :active_menus
  get "/" => "home#index"
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
