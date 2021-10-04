Rails.application.routes.draw do
  post "users/login", to: "users#login"
  post "users/create", to: "users#create"
  get "users", to: "users#index"
  get "users/:id", to: "users#show"
  resources :users
  resources :todos

end
