Rails.application.routes.draw do
  # get 'species/index'
  # get 'species/show'
  # get 'characters/index'
  # get 'characters/show'
  # get 'films/index'
  # get 'films/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :films, only: [:index, :show]
  resources :characters, only: [:index, :show]
  resources :species, only: [:index, :show]
end
