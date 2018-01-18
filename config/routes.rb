Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: %i{index destroy}
  resources :account_activations, only: :edit
  resources :password_resets, except: %i{index show destroy}
  resources :tours, only: %i{index show}
  resources :bookingtours, only: %i{show create destroy}
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
    resources :bookingtours, except: %i(new create show)
    root "tours#index"
  end
end
