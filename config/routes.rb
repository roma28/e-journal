Rails.application.routes.draw do

  root "static_pages#home"

  resources :users

  match "/about", to: "static_pages#about", via: "get"

end
