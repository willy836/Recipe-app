# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#foods'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: %i[index show]
end
