Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: %i[index show]
end
