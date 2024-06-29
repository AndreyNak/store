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
    root 'products#index'

    get '/current_user', to: 'current_user#index'

    concern :chattable do
      resources :chats do
        post :send_message
      end
    end

    resources :notifications, only: [:index] do
      member do
        patch :mark_as_read
      end
    end

    resources :type_products, only: :index

    resources :products, only: %i[index show] do
      member do
        patch :increment_quantity
        patch :decrement_quantity
        post :toggle_favorite
      end

      resources :comments, only: %i[index create update destroy], module: :products do
        patch :toggle_like
        get :sub_comments
        patch :disable_commiserate, on: :collection
      end
    end

    resource :cart, only: [:show] do
      post 'add_product/:product_id', action: :add_product
      delete 'remove_product/:product_id', action: :remove_product
      post 'increment_quantity/:product_id', action: :increment_quantity
      post 'decrement_quantity/:product_id', action: :decrement_quantity
      post 'checkout', on: :collection
    end

    patch :profile, to: 'profile#update'
    namespace :profile do
      post :set_locale, to: 'locales#set_locale'

      resources :orders, only: %i[index update] do
        member do
          patch :cancel
          patch :reject
        end
      end

      resources :restrictions, only: %i[index]
    end

    namespace :admin do
      resources :users, only: %i[index show update] do
        resources :restrictions, only: %i[index], module: :users do
          patch :cancel, on: :member
        end
      end

      resources :orders, only: :index do
        collection do
          get :live
          get :states
          get :statistics
        end
      end

      resources :roles, only: %i[index update] do
        collection do
          resources :permissions, only: %i[index update create destroy], module: :roles
        end
      end

      resources :products, except: [:show] do
        patch :make_discount
      end

      resources :type_products, except: [:show]

      concerns :chattable
    end

    namespace :support do
      get :main, to: 'main#index'

      concerns :chattable
    end
  end
end
