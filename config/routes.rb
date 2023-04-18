Rails.application.routes.draw do
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  devise_for :users
  root to: "users#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: %i[index show]
end
