Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :menus
  resources :order_items
  resources :menu_items
  resources :admins

  patch "menus/edit_menu_details" => "menus#edit_menu_details", as: :edit_menu_details
  patch "menu_item/edit_menu_items_details" => "menu_items#edit_menu_item_details", as: :edit_menu_item_details
  get "admins/manage_billers" => "admins#manage_billers", as: :manage_billers
  get "admins/new_clerk" => "admins#new_clerk", as: :new_clerk
  post "admins/create_clerk" => "admins#create_clerk", as: :create_clerk
  get "admins/users" => "admins#users", as: :show_users
  get "admins/reports" => "admins#reports", as: :show_reports
  delete "admins/delete_user" => "admins#delete_user", as: :delete_user
  patch "admins/role_clerk" => "admins#role_change_clerk", as: :role_change_clerk
  patch "admins/role_customer" => "admins#role_change_customer", as: :role_change_customer
  get "/orders/pending" => "orders#pending", as: :pending_orders
  get "/" => "home#index"
  post "/cart" => "orders#cart"
  get "/active" => "menus#active_menus", as: :active_menus
  post "/signin" => "sessions#create", as: :sessions
  get "/signin" => "sessions#new", as: :new_sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
