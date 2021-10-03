Rails.application.routes.draw do
 # get "users", to: "users#index"
  post "users/login", to: "users#login"
  post "users/create", to: "users#create"
  get "users", to: "users#index"
  get "users/:id", to: "users#show_user"
  resources :users
 # resources :todos

end
