# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sq'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users
    resources :products, except: [:show]
  end
  resources :products, only: [:inex]

  resource :cart, only: [:show] do
    post 'add_product/:product_id', action: :add_product, as: :add_product_to
    delete 'remove_product/:product_id', action: :remove_product, as: :remove_product_from
    post 'increment_quantity/:product_id', action: :increment_quantity, as: :increment_quantity
    post 'decrement_quantity/:product_id', action: :decrement_quantity, as: :decrement_quantity
    post 'checkout', on: :collection
  end

  get 'profile', to: 'profile#edit'
  patch 'profile', to: 'profile#update'

  namespace :profile do
    resources :orders, only: :index do
      patch 'cancel', to: 'orders#cancel'
      patch 'reject', to: 'orders#reject'
    end
  end

  root 'products#index'
end
