Rails.application.routes.draw do
  resources :films, only: [:index, :show]
  resources :characters, only: [:index, :show]
  resources :species, only: [:index, :show]

  root to: "home#index"
end
