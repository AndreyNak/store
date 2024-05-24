# frozen_string_literal: true

require 'sidekiq/web'
require 'rswag'

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use Rails.application.config.session_store, Rails.application.config.session_options

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
  end

  mount Sidekiq::Web => '/sq'

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    get '/current_user', to: 'current_user#index'

    resources :type_products, only: :index

    resources :products, only: :index do
      patch 'increment_quantity', action: :increment_quantity, as: :increment_quantity
      patch 'decrement_quantity', action: :decrement_quantity, as: :decrement_quantity
      post 'toggle_favorite', on: :member
    end

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
      resources :orders, only: %i[index update] do
        patch 'cancel', to: 'orders#cancel'
        patch 'reject', to: 'orders#reject'
      end
    end

    namespace :admin do
      get 'dashboard', to: 'dashboard#index'
      resources :users, only: %i[index show update]
      resources :roles, only: :index
      resources :products, except: [:show]
      resources :type_products, except: [:show]

      resources :chats do
        post 'send_message', action: :send_message, as: :send_message
      end
    end

    namespace :support do
      get 'main', to: 'main#index'

      resources :chats do
        post 'send_message', action: :send_message, as: :send_message
      end
    end

    root 'products#index'
  end
end
