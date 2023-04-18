Rails.application.routes.draw do
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  devise_for :users
  root to: "users#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do 
    resources :recipe_foods, only: [:new, :create, :destroy, :edit]
  end
end
