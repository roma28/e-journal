Rails.application.routes.draw do

  root "static_pages#home"

  match "/404", to: "error_pages#not_found", via: "get"
  match "/500", to: "error_pages#internal_server_error", via: "get"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match "/about", to: "static_pages#about", via: "get"

  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"

end
