Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/tours", to: "static_pages#tours"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: %i(show new creat)
  resources :tours, only: :show

  namespace :admin do
    resources :tours, except: :show
    root "tours#index"
  end
end
