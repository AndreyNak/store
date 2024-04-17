# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :admin do
    resources :users
  end

  root 'products#index'
  resources :products

  resource :cart, only: [:show] do
    post 'add_product/:product_id', action: :add_product, as: :add_product_to
    delete 'remove_product/:product_id', action: :remove_product, as: :remove_product_from
    post 'increment_quantity/:product_id', action: :increment_quantity, as: :increment_quantity
    post 'decrement_quantity/:product_id', action: :decrement_quantity, as: :decrement_quantity
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
