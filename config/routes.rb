Rails.application.routes.draw do
  
  apipie
  resources :projects do
        resources :tasks
  end
  root to: "home#index"

  get "apis/all", to: "apis#index"

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
