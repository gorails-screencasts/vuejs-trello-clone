require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications

    root to: "users#index"
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :lists do
    member do
      patch :move
    end
  end
  resources :cards do
    member do
      patch :move
    end
  end

  root to: 'lists#index'
end
