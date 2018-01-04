Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/tours", to: "static_pages#tours"
  root "static_pages#home"
end
