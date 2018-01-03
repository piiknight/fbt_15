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
  resources :users, except: %i{index destroy}
  resources :tours, only: :show
  resources :bookingtours, only: %i{show create}
  resources :history_bookings, only: :index

  namespace :admin do
    resources :tours, except: :show
    resources :categories, except: :show
    resources :users, except: :show
    root "tours#index"
  end
end
