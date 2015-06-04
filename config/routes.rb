Rails.application.routes.draw do

  root "static_pages#home"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match "/about", to: "static_pages#about", via: "get"

  match "/signin", to: "sessions#new", via: "get"
  match "/signout", to: "sessions#destroy", via: "delete"

end
