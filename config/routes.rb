# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/destroy'
  get 'recipes/index'
  get 'recipes/show'
  root 'users#foods'
  resources :recipes, only: %i[index show]
end
