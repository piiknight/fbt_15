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
  resources :account_activations, only: :edit
  resources :password_resets, except: %i{index show destroy}
  resources :bookingtours, only: %i{show create}
  resources :history_bookings, only: :index
  resources :tours, only: :show do
    resources :reviews, except: :show do
      resources :comments, only: %i(create destroy)
    end
  end

  namespace :admin do
    resources :tours, except: :show
    resources :categories, except: :show
    resources :users, except: :show
    root "tours#index"
  end
end
